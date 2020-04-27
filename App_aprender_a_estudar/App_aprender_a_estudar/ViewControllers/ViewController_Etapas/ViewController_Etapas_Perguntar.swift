//
//  ViewController_Etapas_Perguntar.swift
//  App_aprender_a_estudar
//
//  Created by Rodrigo Ryo Aoki on 13/04/20.
//  Copyright © 2020 Rodrigo Ryo Aoki. All rights reserved.
//

import UIKit

class ViewController_Etapas_Perguntar: UIViewController {

    var estudoSelecionado: Estudo!
    
    var tela: Int!
    
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
        performSegue(withIdentifier: "segueForCampoTexto", sender: 6)
    }
    
   @IBAction func respostas(_ sender: Any) {
        performSegue(withIdentifier: "segueForCampoTexto", sender: 7)
   }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueForCampoTexto"{
            let navController: UINavigationController = segue.destination as! UINavigationController
        
            if let campoTexto: ViewController_CampoTexto = navController.viewControllers.first as? ViewController_CampoTexto{
                tela = sender as? Int
                print(tela as Any)
                campoTexto.tela = tela
                campoTexto.estudoSelecionado = estudoSelecionado
                print("entrando no campo texto")
            }
        }
        
        if let ler: ViewController_Etapas_Ler = segue.destination as? ViewController_Etapas_Ler {
            ler.estudoSelecionado = estudoSelecionado
            print("Entrando em Ler")
        }
        
        if let ajuda: ViewController_Ajuda = segue.destination as? ViewController_Ajuda {
            ajuda.texto = "Após a leitura geral do texto, deve-se elencar dúvidas e perguntas que não ficaram claras. É este o momento de dialogar com a obra ou com o conteúdo que se está estudando, elaborando questões que ficaram suspensas. Teve dúvidas sobre algum tópico da matéria? É essa a hora de anotar tudo e levar ao professor na próxima aula. O importante é não receber passivamente as informações: deve-se questionar tudo que for possível."
        }
    }
    
    
    
}
