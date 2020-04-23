//
//  ViewController_Etapas_Perguntar.swift
//  App_aprender_a_estudar
//
//  Created by Rodrigo Ryo Aoki on 13/04/20.
//  Copyright © 2020 Rodrigo Ryo Aoki. All rights reserved.
//

import UIKit

class ViewController_Etapas_Perguntar: UIViewController {

    var estudoSelecionado: Estudo?
    
    var tela: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func anotacoes_perguntas(_ sender: Any) {
        tela = "anotacoes_perguntas"
        print("tela anotacoes")
    }
    
    @IBAction func respostas(_ sender: Any) {
        tela = "respostas"
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let campoTexto: ViewController_CampoTexto  = segue.destination as?
            ViewController_CampoTexto {
            campoTexto.estudoSelecionado = estudoSelecionado
            campoTexto.tela = self.tela
        }
    }
    
    
    
}
