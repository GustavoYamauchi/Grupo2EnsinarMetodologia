//
//  ViewController_Etapas_Rememorar.swift
//  App_aprender_a_estudar
//
//  Created by Rodrigo Ryo Aoki on 13/04/20.
//  Copyright © 2020 Rodrigo Ryo Aoki. All rights reserved.
//

import UIKit

class ViewController_Etapas_Rememorar: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let ajuda: ViewController_Ajuda = segue.destination as? ViewController_Ajuda {
            ajuda.texto = "A quarta etapa deve ser aplicada ao fim de cada sessão de estudo, ou de cada mudança de capítulo. O estudante deve relembrar tudo que foi estudado, fazendo um pequeno resumo mental e anotando-o no papel. A intenção é fixar o que está solidificado e identificar pequenas lacunas que ainda estejam evidentes, como algum detalhe que não ficou totalmente esclarecido e dúvidas que ainda precisem ser sanadas."
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
