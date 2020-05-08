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

class ViewController_Grafico: UIViewController, ChartViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    var vetorNomes = [String]()
    public var vetorDados = [ChartDataEntry]()
    
    @IBOutlet weak var grafico: LineChartView!
    
    @IBOutlet weak var pickerMaterias: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        grafico.delegate = self
        pickerMaterias.delegate = self
        pickerMaterias.dataSource = self
        
        grafico.doubleTapToZoomEnabled = false
        grafico.rightAxis.enabled = false
        
        grafico.xAxis.labelPosition = .bottom
        grafico.animate(xAxisDuration: 2.0)
        
        rec_dados_materias()
        //grafico.xAxis.setLabelCount(6, force: false)
        
        carregarGrafico()

        converterChartDataEntry(index: pickerMaterias.selectedRow(inComponent: 0))
        let set = LineChartDataSet(entries: vetorDados)
        set.colors = ChartColorTemplates.material()
        
        let data = LineChartData(dataSet: set)
        
        grafico.data = data
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        pickerMaterias.reloadAllComponents()
        rec_dados_materias()
        
        carregarGrafico()
        
        let set = LineChartDataSet(entries: vetorDados)
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
           let materia = Materia(nome: vetorNomes[i]).restaurarMateria()
           vetorMaterias.append(materia)
           i += 1
       }
    }
    
    func converterChartDataEntry(index: Int){
        if vetorMaterias.count > 0{
            if vetorMaterias[index].vetorDatas.count != 0{
                vetorDados.removeAll()
                for i in 0...vetorMaterias[index].vetorDatas.count-1{
                    vetorDados.append(ChartDataEntry(x: vetorMaterias[index].vetorDatas[i], y: vetorMaterias[index].vetorNotas[i]))
                    print(vetorMaterias[index].vetorDatas[i])
                }
            }
        }
        
        viewWillAppear(false)
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        converterChartDataEntry(index: row)
    }
    
    func carregarGrafico(){
        if(vetorMaterias.count != 0){
            if(vetorMaterias[pickerMaterias.selectedRow(inComponent: 0)].vetorNotas.count > 0){
                let xValuesFormatter = DateFormatter()
                xValuesFormatter.dateFormat = "dd \nMM"
                if(vetorMaterias.count != 0){
                    if(vetorMaterias[pickerMaterias.selectedRow(inComponent: 0)].vetorNotas.count > 0){
                        print(Date(timeIntervalSince1970: vetorMaterias[pickerMaterias.selectedRow(inComponent: 0)].vetorDatas[0]))
                        let xValuesNumberFormatter = ChartXAxisFormatter(referenceTimeInterval: vetorMaterias[pickerMaterias.selectedRow(inComponent: 0)].vetorDatas[0], dateFormatter: xValuesFormatter)
                            xValuesNumberFormatter.dateFormatter = xValuesFormatter // e.g. "wed 26"
                        grafico.xAxis.valueFormatter = xValuesNumberFormatter
                    }
                        
                }
            }
        }
    }
}
