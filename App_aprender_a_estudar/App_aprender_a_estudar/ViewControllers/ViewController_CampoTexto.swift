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
    
    var estudoSelecionado: Estudo!
    
    var tela: Int!    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch tela {
            case 6:
                Espaco_de_texto.text = estudoSelecionado.anotacoes_perguntas ?? ""
                
            case 7:
                Espaco_de_texto.text = estudoSelecionado.respostas ?? ""
                
            case 8:
                Espaco_de_texto.text = estudoSelecionado.resumo ?? ""
                
            case 9:
                Espaco_de_texto.text = estudoSelecionado.reflexao ?? ""
            
            default:
                Espaco_de_texto.text = ""
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnVoltar(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        salvarTextos()
    }

    @IBAction func btnSalvar(_ sender: Any) {
        salvarTextos()
    }
    func salvarTextos(){
        switch tela {
            case 6:
                estudoSelecionado.anotacoes_perguntas = Espaco_de_texto.text
                estudoSelecionado.save()
            case 7:
                estudoSelecionado.respostas = Espaco_de_texto.text
                estudoSelecionado.save()
            
            case 8:
                estudoSelecionado.resumo = Espaco_de_texto.text
                estudoSelecionado.save()
            
            case 9:
                estudoSelecionado.reflexao = Espaco_de_texto.text
                estudoSelecionado.save()
            
            default:
                estudoSelecionado.save()
        }
    }
}
