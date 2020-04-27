//
//  ViewController_Etapas_Repassar.swift
//  App_aprender_a_estudar
//
//  Created by Rodrigo Ryo Aoki on 13/04/20.
//  Copyright © 2020 Rodrigo Ryo Aoki. All rights reserved.
//

import UIKit

class ViewController_Etapas_Repassar: UIViewController {
    
    var estudoSelecionado: Estudo!
    
    var tela: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueForCampoTexto"{
            let navController: UINavigationController = segue.destination as! UINavigationController
        
            if let campoTexto: ViewController_CampoTexto = navController.viewControllers.first as? ViewController_CampoTexto{
                tela = sender as? Int
                print(tela)
                campoTexto.tela = tela
                campoTexto.estudoSelecionado = estudoSelecionado
                print("entrando no campo texto")
            }
        }
        
        if let ajuda: ViewController_Ajuda = segue.destination as? ViewController_Ajuda {
            ajuda.texto = "Repassar consiste em uma análise mais completa do que foi estudado. Vale pegar todos os resumos, anotações e mapas mentais produzidos, para checar se está tudo em ordem. Procure a ajuda de colegas nessa etapa, discutindo com eles os temas para fazer uma verificação do que foi aprendido e, possivelmente, levantando mais tópicos para discussão."
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
