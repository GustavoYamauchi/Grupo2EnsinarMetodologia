//
//  TableViewController.swift
//  App_aprender_a_estudar
//
//  Created by Gustavo Yamauchi on 02/04/20.
//  Copyright © 2020 Rodrigo Ryo Aoki. All rights reserved.
//

import Foundation
import UIKit

class TableViewController: UITableViewController {
    
    @IBOutlet var tabela: UITableView!
    
    @IBOutlet weak var nav: UINavigationItem!
    
    @IBAction func btnReload(_ sender: Any) {
        reloadTabela()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rec_data()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        array.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let newCell:CustomCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CustomCell
        
        newCell.label?.text = array[indexPath.row].Nome
        newCell.btnExcluir.tag = indexPath.row
        newCell.btnExcluir?.addTarget(self, action: #selector(excluirEstudo), for: .touchUpInside)
        
        newCell.index = indexPath.row
        
        return newCell
    }
    
    func reloadTabela(){
        rec_data()
        tabela.reloadData()
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
            print(estudo.Nome!)
             array.append(estudo)
            j += 1
        }
    }
}

