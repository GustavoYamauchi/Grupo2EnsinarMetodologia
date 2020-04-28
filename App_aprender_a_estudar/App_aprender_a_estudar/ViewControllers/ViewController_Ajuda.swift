//
//  ViewController_Ajuda.swift
//  App_aprender_a_estudar
//
//  Created by Douglas Cardoso Ferreira on 24/04/20.
//  Copyright © 2020 Rodrigo Ryo Aoki. All rights reserved.
//

import Foundation
import UIKit

class ViewController_Ajuda: UIViewController {

    @IBOutlet weak var lblTexto: UILabel!
    var texto: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTexto.text = texto!
    }
    
    @IBAction func btnEntendi(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
