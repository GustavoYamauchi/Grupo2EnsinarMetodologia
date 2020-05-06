//
//  ViewControllerGrafico.swift
//  App_aprender_a_estudar
//
//  Created by Gustavo Yamauchi on 29/04/20.
//  Copyright © 2020 Rodrigo Ryo Aoki. All rights reserved.
//

import Foundation
import UIKit
import Charts

var vetorMaterias = [Materia]()

class ViewController_Grafico: UIViewController, ChartViewDelegate {
    
    
    var vetorNomes = [String]()
    
    @IBOutlet weak var grafico: LineChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        grafico.delegate = self
        grafico.doubleTapToZoomEnabled = false

        rec_dados_materias()
        let set = LineChartDataSet(entries: vetorMaterias[0].vetorNotas)
        set.colors = ChartColorTemplates.joyful()
        
        let data = LineChartData(dataSet: set)
        
        grafico.data = data
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        let set = LineChartDataSet(entries: vetorMaterias[0].vetorNotas)
        set.colors = ChartColorTemplates.joyful()
        
        let data = LineChartData(dataSet: set)
        
        grafico.data = data
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addNotaVC : ViewController_AddNota = segue.destination as? ViewController_AddNota {
        
            addNotaVC.vetorNomes = self.vetorNomes
        }
    }
    
    func rec_dados_materias(){
        
       vetorMaterias.removeAll()

       vetorNomes = UserDefaults.standard.object(forKey: "Nome das Materias") as! [String]

       var i = 0
    
       while(i < vetorNomes.count){
            Materia(nome: vetorNomes[i]).restaurarMateria()
           vetorMaterias.append(Materia(nome: vetorNomes[i]))
           i += 1
       }
    }
}
