//
//  ViewController_Ajuda.swift
//  App_aprender_a_estudar
//
//  Created by Douglas Cardoso Ferreira on 23/04/20.
//  Copyright © 2020 Rodrigo Ryo Aoki. All rights reserved.
//

import Foundation
import UIKit

class ViewController_Ajuda:UIViewController {
    
    var texto: String!
    @IBOutlet weak var lblTexto: UILabel!
    @IBAction func btnEntendi(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTexto.text = texto
    }
}
