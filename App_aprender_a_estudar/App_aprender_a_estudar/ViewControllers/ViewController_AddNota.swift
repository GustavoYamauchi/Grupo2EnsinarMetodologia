//
//  ViewController_AddNota.swift
//  App_aprender_a_estudar
//
//  Created by Gustavo Yamauchi on 05/05/20.
//  Copyright © 2020 Rodrigo Ryo Aoki. All rights reserved.
//

import Foundation
import UIKit

class ViewController_AddNota: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var vetorNomes:[String]!
    var testeDeVariaveis: (String, String?, Date)!
    @IBOutlet weak var pickerDataNota: UIDatePicker!
    
    @IBOutlet weak var pickerMaterias: UIPickerView!
    
    @IBOutlet weak var txtNota: UITextField!
    
    @IBAction func btnSalvarNota(_ sender: Any) {
        
        let materia = vetorNomes[pickerMaterias.selectedRow(inComponent: 0)]
        
        
        let nota = Double(txtNota.text!)
        
        let data = (pickerDataNota.date).timeIntervalSinceReferenceDate
        
        
        
        //testeDeVariaveis = (materia, nota, data)
        
        let materiaBuscar : Materia = Buscar(materiaNome: materia)
        
        
        materiaBuscar.addNota(data: data, nota: nota!)
        materiaBuscar.salvar()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerMaterias.delegate = self
        pickerMaterias.dataSource = self
        pickerMaterias.dataSource = self.vetorNomes as? UIPickerViewDataSource
        pickerDataNota.datePickerMode = .date
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return vetorNomes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return vetorNomes[row]
    }
    
    
    func Buscar(materiaNome: String) -> Materia{
        for materia in vetorMaterias{
            if materia.nome == materiaNome{
                 return materia
            }
        }
        
        return Materia(nome: "ERRO")
    }

}
