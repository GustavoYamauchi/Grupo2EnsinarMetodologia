//
//  ViewController_Etapas_Perguntar.swift
//  App_aprender_a_estudar
//
//  Created by Rodrigo Ryo Aoki on 13/04/20.
//  Copyright © 2020 Rodrigo Ryo Aoki. All rights reserved.
//

import UIKit

class ViewController_Etapas_Perguntar: UIViewController {

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
<<<<<<< Updated upstream

=======
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
        
        if let ajuda: ViewController_Ajuda = segue.destination as? ViewController_Ajuda {
            ajuda.texto = "Após a leitura geral do texto, deve-se elencar dúvidas e perguntas que não ficaram claras. É este o momento de dialogar com a obra ou com o conteúdo que se está estudando, elaborando questões que ficaram suspensas. Teve dúvidas sobre algum tópico da matéria? É essa a hora de anotar tudo e levar ao professor na próxima aula. O importante é não receber passivamente as informações: deve-se questionar tudo que for possível."
        }
    }
    
    
    
>>>>>>> Stashed changes
}
