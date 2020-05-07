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
        print("\n" + array[0].nome!)
        
        array[i].save() //salva um arquivo com as infos do objeto
        array[i].save_filename(i: i) //salva o nome do arquivo do objeto em outro arquivo
        
        //label1.text = "Confirmado"
        //label2.text = "Confirmado"
        
        tableView.reloadData()
    }
}

var i: Int = -1

var array = [Estudo]()

var listaBusca = [Estudo]()

class ViewControllerHome: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var Buscar: UITextField!
    
    @IBOutlet weak var barraDeBusca: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        rec_data()
        
        //Buscar.addTarget(self, action: #selector(self.buscarEstudo), for: .editingChanged)
    }
    
    override func unwind(for unwindSegue: UIStoryboardSegue, towards subsequentVC: UIViewController) {
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let criarEstudo = segue.destination as? ViewController_AddEstudo2 {
                //print("passei")
                criarEstudo.estudoDelegate = self
            }
        
            if segue.identifier == "segueForEtapas"{
                
                let navController: UINavigationController = segue.destination as! UINavigationController
                
                //print(navController)
                if let etapasEstudos: ViewController_Etapas_Explorar  = navController.viewControllers.first as?
                    ViewController_Etapas_Explorar {
                    etapasEstudos.estudoSelecionado = array[(tableView.indexPathForSelectedRow?.row)!]
                }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let newCell:CustomCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CustomCell
        
        newCell.label?.text = array[indexPath.row].nome
        newCell.btnExcluir.tag = indexPath.row
        newCell.btnExcluir?.addTarget(self, action: #selector(excluirEstudo), for: .touchUpInside)
        
        newCell.index = indexPath.row
        
        return newCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segueForEtapas", sender: self)
    }
    
    @objc func excluirEstudo(sender: UIButton){
        print(sender.tag)
        
        array[Int(sender.tag)].remove(i: i)
        
        rec_data()
        tableView.reloadData()
    }
    
    @objc func buscarEstudo(){  //Não implementado
        listaBusca.removeAll()
        let texto = Buscar.text
        var estudoListado: String?
        
        print(texto)    //Debugger
        
        var i = 0 //indice para achar o estudo no array
        
        var j = 0   //Debugger
        
        while(i < array.count){ //Comparar com o vetor de estudo e adicionar para a lista caso encontre correspondecia com o textfield
            estudoListado = array[i].nome?.lowercased() //Deixa tudo minusculo
            if(estudoListado!.contains(texto!.lowercased())){   //Deixa tudo minusculo
                listaBusca.append(array[i]) //Coloca para a lista de busca
            }
            i += 1
        }
        
        print(listaBusca.count) //Debugger
        while(j < listaBusca.count){    //Debugger
            print(listaBusca[j].nome)
            j += 1
        }
    }

    func rec_data(){
        array.removeAll()
        var j = 1

        let fileName = "Nomes dos Arquivos"
        let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)

         let fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
        //print("FilePath: \(fileURL.path)")

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
         else{
            i = -1
        }

         while (j <= i+1){
            let estudo: Estudo = Estudo(Nome: "", Descricao: "", Materia: "")
            estudo.restore(file: arrayOfRead[j])
            print(estudo.nome!)
            array.append(estudo)
            j += 1
        }
    }
}

