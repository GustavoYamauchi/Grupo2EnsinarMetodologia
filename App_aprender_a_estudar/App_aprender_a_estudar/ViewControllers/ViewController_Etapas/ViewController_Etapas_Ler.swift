//
//  ViewController_Etapas_Ler.swift
//  App_aprender_a_estudar
//
//  Created by Rodrigo Ryo Aoki on 13/04/20.
//  Copyright © 2020 Rodrigo Ryo Aoki. All rights reserved.
//

import UIKit

class ViewController_Etapas_Ler: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let ajuda: ViewController_Ajuda = segue.destination as? ViewController_Ajuda {
            ajuda.texto = "No caso, ler consiste em analisar e resumir. Trata-se de uma leitura aprofundada e atenta, com finalidade de produzir pensamento crítico. O estudante deve saber identificar as partes fundamentais do texto e saber diferenciá-las das complementares. O modo ideal de seguir este passo é fazendo anotações, sublinhando e grifando partes importantes do texto e elaborar esquemas que possam ser usados na revisão."
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
