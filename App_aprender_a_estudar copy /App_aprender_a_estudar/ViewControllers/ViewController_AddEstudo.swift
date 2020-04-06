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
        
        array[i].save() //salva um arquivo com as infos do objeto
        array[i].save_filename(i: i) //salva o nome do arquivo do objeto em outro arquivo
        
        label1.text = "Confirmado"
        label2.text = "Confirmado"
        
    }
    
    @IBAction func mostrar(_ sender: Any) {
        array[0].remove(i: i)
        i -= 1
//        label1.text = array[i].Nome
//        label2.text = array[i].Descricao
    }
    
}

extension ViewController_AddEstudo: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


