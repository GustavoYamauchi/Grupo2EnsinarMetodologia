//
//  ViewController_Etapas_Análise.swift
//  App_aprender_a_estudar
//
//  Created by Rodrigo Ryo Aoki on 08/05/20.
//  Copyright © 2020 Rodrigo Ryo Aoki. All rights reserved.
//

import UIKit

class ViewController_Etapas_Ana_lise: UIViewController {
    
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

    @IBAction func pergutas(_ sender: Any) {
        performSegue(withIdentifier: "segueForCampoTexto", sender: 6)
    }
    @IBAction func respostas(_ sender: Any) {
        performSegue(withIdentifier: "segueForCampoTexto", sender: 7)
    }
    
    @IBAction func resumo(_ sender: Any) {
        performSegue(withIdentifier: "segueForCampoTexto", sender: 8)
    }
    
    @IBAction func reflexão(_ sender: Any){
        performSegue(withIdentifier: "segueForCampoTexto", sender: 9)
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
}
}
