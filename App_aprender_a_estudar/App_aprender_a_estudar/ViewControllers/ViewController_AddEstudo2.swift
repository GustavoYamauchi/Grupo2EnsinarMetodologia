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
    
    @IBOutlet weak var fieldTitulo: UITextView!
    
    @IBOutlet weak var fieldCategoria: UITextView!
    
    @IBOutlet weak var fieldDescricao: UITextView!
    
    
   weak var estudoDelegate: EstudoDelegate?


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
        
        estudoDelegate?.salvar(estudo: estudo)
    }
    
}

extension ViewController_AddEstudo2: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


