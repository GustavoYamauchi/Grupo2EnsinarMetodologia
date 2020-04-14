//
//  ViewControllerHome.swift
//  App_aprender_a_estudar
//
//  Created by Gustavo Yamauchi on 09/04/20.
//  Copyright © 2020 Rodrigo Ryo Aoki. All rights reserved.
//

import Foundation
import UIKit

protocol EstudoDelegate: class {
    func salvar(estudo: Estudo)
}

extension ViewControllerHome: EstudoDelegate{
    
    func salvar(estudo: Estudo) {
        array.append(estudo)
        i += 1
        print(i)
        print("\n" + array[0].getNome())
        
        array[i].save() //salva um arquivo com as infos do objeto
        array[i].save_filename(i: i) //salva o nome do arquivo do objeto em outro arquivo
        
        //label1.text = "Confirmado"
        //label2.text = "Confirmado"
        
        tableView.reloadData()
    }
}

var i: Int = -1

var array = [Estudo]()

class ViewControllerHome: UIViewController, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        rec_data()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(segue.destination)
            if let criarEstudo = segue.destination as? ViewController_AddEstudo2 {
                print("passei")
                criarEstudo.estudoDelegate = self
            }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let newCell:CustomCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CustomCell
        
        newCell.label?.text = array[indexPath.row].Nome
        newCell.btnExcluir.tag = indexPath.row
        newCell.btnExcluir?.addTarget(self, action: #selector(excluirEstudo), for: .touchUpInside)
        
        newCell.index = indexPath.row
        
        return newCell
    }
    
    @objc func excluirEstudo(sender: UIButton){
        print(sender.tag)
        
        array[Int(sender.tag)].remove(i: i)
    }
    
    func rec_data(){
        array.removeAll()
        var j = 1

        let fileName = "Nomes dos Arquivos"
        let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)

         let fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
        print("FilePath: \(fileURL.path)")

         var readString = "" // Used to store the file contents
                do {
                    // Read the file contents
                    readString = try String(contentsOf: fileURL)
                } catch let error as NSError {
                    print("Failed reading from URL: \(fileURL), Error: " + error.localizedDescription)
                }
        //        print("\n"+readString) Para olhar se está registrando e o que está sendo lido
        let arrayOfRead = readString.components(separatedBy: "\n")

         if(Int(arrayOfRead[0]) ?? -1 >= 0){
                i = Int(arrayOfRead[0]) ?? 0
        }

         while (j <= i+1){
            let estudo: Estudo = Estudo(Nome: "", Descricao: "")
            estudo.restore(file: arrayOfRead[j])
             print(estudo.getNome())
             array.append(estudo)
            j += 1
        }
    }
    
}

