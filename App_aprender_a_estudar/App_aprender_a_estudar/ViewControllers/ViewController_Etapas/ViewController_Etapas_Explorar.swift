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
    
    var estudoSelecionado: Estudo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //labelName.text = estudo.Nome!
        //define se o botão estava ligado
        
        //falta conseguir pegar qual estudo do array o usuário entrou
        
        s_finalidades.isOn = estudoSelecionado.switch_f!

        s_observar.isOn = estudoSelecionado.switch_o!

        s_pesquisar.isOn = estudoSelecionado.switch_p!

        s_descobrir.isOn = estudoSelecionado.switch_d!
    }
    
    @IBAction func switch_finalidades(_ sender: Any) {
        estudoSelecionado.switch_f = s_finalidades.isOn
        estudoSelecionado.save()
    }
    
    @IBAction func switch_observar(_ sender: Any) {
        estudoSelecionado.switch_o = s_observar.isOn
        estudoSelecionado.save()
    }
    
    @IBAction func switch_pesquisar(_ sender: Any) {
        estudoSelecionado.switch_p = s_pesquisar.isOn
        estudoSelecionado.save()
    }
    
    @IBAction func switch_descobrir(_ sender: Any) {
        estudoSelecionado.switch_d = s_descobrir.isOn
        estudoSelecionado.save()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if let campoTexto: ViewController_CampoTexto  = segue.destination as?
            ViewController_CampoTexto {
            campoTexto.texto = estudoSelecionado.anotacoes_perguntas
            campoTexto.tela = "anotacoes_perguntas"
        }
        
        if let perguntar: ViewController_Etapas_Perguntar  = segue.description as?
            ViewController_Etapas_Perguntar {
            perguntar.estudoSelecionado = estudoSelecionado
        }
        
        if let ajuda: ViewController_Ajuda = segue.destination as? ViewController_Ajuda {
            ajuda.texto = "O primeiro passo se refere mais ao estudo de um livro-texto, seja um didático ou um romance (como da lista de obras obrigatórias, por exemplo). Consiste realmente em explorar aquela obra: quais são as finalidades do autor? O que ele quis passar com aquele conteúdo? O método considera também que se deve observar a obra como um todo. Em resumo, o mais importante na primeira etapa é descobrir o livro e o seu conteúdo, deixando a curiosidade levar."
        }
    }
    
    @IBAction func btnVoltar(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func AnotacoesPerguntas(_ sender: Any) {
         
        }
    }

