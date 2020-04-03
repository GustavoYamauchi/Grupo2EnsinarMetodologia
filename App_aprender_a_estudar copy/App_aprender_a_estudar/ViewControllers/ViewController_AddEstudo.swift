//
//  ViewController_AddEstudo.swift
//  App_aprender_a_estudar
//
//  Created by Rodrigo Ryo Aoki on 30/03/20.
//  Copyright © 2020 Rodrigo Ryo Aoki. All rights reserved.
//

import UIKit

class ViewController_AddEstudo: UIViewController {
    
    @IBOutlet weak var Nome: UITextField!
    
    @IBOutlet weak var Descricao: UITextField!
    
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure_textfields()
        
        // Do any additional setup after loading the view.
    }
    
    
    private func configure_textfields(){
        Nome.delegate = self
        Descricao.delegate = self
    }
    
    @IBAction func Confirmar(_ sender: Any) {
        let nome: String? = Nome.text
        let descricao: String? = Descricao.text
        let estudo: Estudo = Estudo(Nome: nome!, Descricao: descricao!)
        array.append(estudo)
        
        i += 1
        print(i)
        print("\n" + array[0].getNome())
        
        label1.text = "Confirmado"
        label2.text = "Confirmado"
        array[i].save()
        array[i].save_filename(i: i)
    }
    
    @IBAction func mostrar(_ sender: Any) {
        label1.text = array[i].getNome()
        label2.text = array[i].getDescricao()
        
    }
    
}

extension ViewController_AddEstudo: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


