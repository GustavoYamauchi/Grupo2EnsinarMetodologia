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
    
    
    @IBAction func back(_ sender: UIBarButtonItem) {
        
    }
    @IBOutlet weak var nav: UINavigationItem!
    
    @IBOutlet weak var fieldTitulo: UITextView!
    
    @IBOutlet weak var fieldCategoria: UITextView!
    
    @IBOutlet weak var fieldDescricao: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configure_textfields()
        
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
        
        let estudo: Estudo = Estudo(Nome: nome!, Descricao: descricao!)
        array.append(estudo)
        
        i += 1
        print(i)
        print("\n" + array[0].getNome())
        
        array[i].save() //salva um arquivo com as infos do objeto
        array[i].save_filename(i: i) //salva o nome do arquivo do objeto em outro arquivo
        
        //label1.text = "Confirmado"
        //label2.text = "Confirmado"
        
    }
    
}

extension ViewController_AddEstudo2: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


