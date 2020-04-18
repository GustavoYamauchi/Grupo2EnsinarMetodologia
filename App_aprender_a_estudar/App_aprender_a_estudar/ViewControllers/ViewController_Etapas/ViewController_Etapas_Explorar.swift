//
//  ViewController_Etapas_Explorar.swift
//  App_aprender_a_estudar
//
//  Created by Rodrigo Ryo Aoki on 09/04/20.
//  Copyright © 2020 Rodrigo Ryo Aoki. All rights reserved.
//

import UIKit



class ViewController_Etapas_Explorar: UIViewController {
    
    
    
    @IBOutlet weak var s_finalidades: UISwitch!
    
    @IBOutlet weak var s_observar: UISwitch!
    
    @IBOutlet weak var s_pesquisar: UISwitch!
    
    @IBOutlet weak var s_descobrir: UISwitch!
    
    @IBOutlet weak var labelName: UILabel!
    
    var estudo: Estudo!
    
    @IBAction func btnBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelName.text = estudo.Nome
        
        //labelName.text = estudo.Nome!
        //define se o botão estava ligado
        
        //falta conseguir pegar qual estudo do array o usuário entrou
        
//        s_finalidades.isOn = array[].switch_f!
//
//        s_observar.isOn = array[].switch_o!
//
//        s_pesquisar.isOn = array[].switch_p!
//
//        s_descobrir.isOn = array[].switch_d!
    }
    
    @IBAction func unwindToExplorar(_ unwindSegue: UIStoryboardSegue) {
        //let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
    }
    @IBAction func switch_finalidades(_ sender: Any) {
//          array[].switch_f = s_finalidades.isOn
    }
    
    @IBAction func switch_observar(_ sender: Any) {
//          array[].switch_o = s_observar.isOn
    }
    
    @IBAction func switch_pesquisar(_ sender: Any) {
//          array[].switch_p = s_pesquisar.isOn
    }
    
    @IBAction func switch_descobrir(_ sender: Any) {
//          array[].switch.d = s_descobrir.isOn
    }
    
}
