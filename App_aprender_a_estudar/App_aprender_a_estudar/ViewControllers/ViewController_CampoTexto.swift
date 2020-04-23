//
//  ViewController_CampoTexto.swift
//  App_aprender_a_estudar
//
//  Created by Rodrigo Ryo Aoki on 17/04/20.
//  Copyright © 2020 Rodrigo Ryo Aoki. All rights reserved.
//

import UIKit

class ViewController_CampoTexto: UIViewController {

    @IBOutlet weak var Espaco_de_texto: UITextView!
    
    var estudoSelecionado: Estudo?
    
    var texto: String?
    
    var tela: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //não está entrando no switch case
        switch tela {
            case "anotacoes_perguntas":
                Espaco_de_texto.text = estudoSelecionado?.anotacoes_perguntas ?? ""
                
            case "respostas":
                Espaco_de_texto.text = estudoSelecionado?.respostas ?? ""
                
            case "resumo":
                Espaco_de_texto.text = estudoSelecionado?.resumo ?? ""
                
            case "reflexão":
                Espaco_de_texto.text = estudoSelecionado?.reflexao ?? ""
            
            default:
                Espaco_de_texto.text = ""
        }
                
        estudoSelecionado?.anotacoes_perguntas = Espaco_de_texto.text
        estudoSelecionado?.save()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnVoltar(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
        switch tela {
            case "anotacoes_perguntas":
                 estudoSelecionado?.anotacoes_perguntas = Espaco_de_texto.text
                estudoSelecionado?.save()
            case "respostas":
                estudoSelecionado?.respostas = Espaco_de_texto.text
                estudoSelecionado?.save()
            
            case "resumo":
                estudoSelecionado?.resumo = Espaco_de_texto.text
                estudoSelecionado?.save()
            
            case "reflexão":
                estudoSelecionado?.reflexao = Espaco_de_texto.text
                estudoSelecionado?.save()
            
            default:
                estudoSelecionado?.save()
        }
    }
}
