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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //labelName.text = estudo.Nome!
        //define se o botão estava ligado
        
        //falta conseguir pegar qual estudo do array o usuário entrou
        
        s_finalidades.isOn = estudo.switch_f!

        s_observar.isOn = estudo.switch_o!

        s_pesquisar.isOn = estudo.switch_p!

        s_descobrir.isOn = estudo.switch_d!
    }
    
    @IBAction func switch_finalidades(_ sender: Any) {
        estudo.switch_f = s_finalidades.isOn
        estudo.save()
    }
    
    @IBAction func switch_observar(_ sender: Any) {
        estudo.switch_o = s_observar.isOn
        estudo.save()
    }
    
    @IBAction func switch_pesquisar(_ sender: Any) {
        estudo.switch_p = s_pesquisar.isOn
        estudo.save()
    }
    
    @IBAction func switch_descobrir(_ sender: Any) {
        estudo.switch_d = s_descobrir.isOn
        estudo.save()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let etapasEstudos: ViewController_CampoTexto  = segue.destination as?
            ViewController_CampoTexto {
            etapasEstudos.texto = estudo.anotacoes_perguntas
        }
    }
    
    @IBAction func AnotacoesPerguntas(_ sender: Any) {
         
        }
    }

