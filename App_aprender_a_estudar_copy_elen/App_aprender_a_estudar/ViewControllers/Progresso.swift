//
//  Progresso.swift
//  App_aprender_a_estudar
//
//  Created by Ellen Couto on 14/04/20.
//  Copyright © 2020 Rodrigo Ryo Aoki. All rights reserved.
//

import Foundation
import UIKit

class Progresso: UIViewController {
  
    enum Segues {
        static let toChart = "toChart"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == Segues.toChart{
        let destVC = segue.destination as! Chart
        destVC.view.backgroundColor = .blue
    }
      }
}
