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
    
    var texto: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Espaco_de_texto.text = texto ?? ""
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
