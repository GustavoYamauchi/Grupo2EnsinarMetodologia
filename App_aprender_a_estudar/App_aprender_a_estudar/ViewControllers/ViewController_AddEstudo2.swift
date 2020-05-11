//
//  ViewController_AddEstudo.swift
//  App_aprender_a_estudar
//
//  Created by Rodrigo Ryo Aoki on 30/03/20.
//  Copyright © 2020 Rodrigo Ryo Aoki. All rights reserved.
//
import Foundation
import UIKit

class ViewController_AddEstudo2: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var nav: UINavigationItem!
    
    @IBOutlet weak var lblCategorias: UILabel!
    
    @IBOutlet weak var fieldTitulo: UITextView!
    
    @IBOutlet weak var fieldCategoria: UITextView!
    
    @IBOutlet weak var fieldDescricao: UITextView!
    
    @IBOutlet weak var Alerta: UILabel!
    
    @IBAction func btnGrafico(_ sender: UISwitch) {
        lblCategorias.isHidden = !(lblCategorias.isHidden)
        fieldCategoria.isHidden = !(fieldCategoria.isHidden)
    }
   weak var estudoDelegate: EstudoDelegate?


    override func viewDidLoad() {
        super.viewDidLoad()
        configure_textfields()
        lblCategorias.isHidden = true
        fieldCategoria.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    
    private func configure_textfields(){
        fieldTitulo.delegate = self
        fieldCategoria.delegate = self
        fieldDescricao.delegate = self
    }
    
    @IBAction func Confirmar(_ sender: Any) {
        let nome: String? = fieldTitulo.text
        let descricao: String? = fieldDescricao.text
        var materia: String? = ""
        
        var i = 0
        var estudoExiste = false
        
        if !lblCategorias.isHidden{
            materia = fieldCategoria.text
            let objMateria = Materia(nome: materia!)
            vetorMaterias.append(objMateria)
            objMateria.salvar()
            objMateria.salvarNomeMaterias()
            
        }
        while(i < array.count){ //VERIFICA SE O ESTUDO JÁ EXISTE E SE ESTA ESCRITO UM NOME
                    if nome == array[i].nome{
                        estudoExiste = true
                    }
                    i += 1
                }
                
                if estudoExiste == false && nome != "" {
                    let estudo: Estudo = Estudo(Nome: nome!, Descricao: descricao!, Materia: materia!)
                    estudoDelegate?.salvar(estudo: estudo)
//                    Alerta.textColor = #colorLiteral(red: 0.03921568627, green: 0.5176470588, blue: 1, alpha: 1)
//                    Alerta.text = "Salvo!"
                    self.navigationController?.popViewController(animated: true)
                }
                    
                else{
                    Alerta.textColor = .red
                    if estudoExiste == true{
                        Alerta.text = "Já existe um estudo com esse nome!"
                    }
                    if nome == ""{
                        Alerta.text = "Digite o nome do estudo!"
                    }
                }
            }
        }

extension ViewController_AddEstudo2: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


