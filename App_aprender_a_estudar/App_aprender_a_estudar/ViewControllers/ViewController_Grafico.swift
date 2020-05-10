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

       var p = 0
    
       while(p < vetorNomes.count){
           let materia = Materia(nome: vetorNomes[p]).restaurarMateria()
           vetorMaterias.append(materia)
           p += 1
       }
    }
    
    func converterChartDataEntry(index: Int){
        if vetorMaterias.count > 0{
            if vetorMaterias[index].vetorDatas.count != 0{
                vetorDados.removeAll()
                var referenceTimeInterval: TimeInterval = 0
                if let minTimeInterval = (vetorMaterias[pickerMaterias.selectedRow(inComponent: 0)].vetorDatas.map { $0 }).min() {
                        referenceTimeInterval = minTimeInterval
                    }
                for p in 0...vetorMaterias[index].vetorDatas.count-1{
                    vetorDados.append(ChartDataEntry(x: (vetorMaterias[index].vetorDatas[p] - referenceTimeInterval) / (3600 * 24), y: vetorMaterias[index].vetorNotas[p]))
                    
                    print(vetorMaterias[index].vetorDatas[p])
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
                if(vetorMaterias.count != 0){
                    if(vetorMaterias[pickerMaterias.selectedRow(inComponent: 0)].vetorNotas.count > 0){
                        print(Date(timeIntervalSince1970: vetorMaterias[pickerMaterias.selectedRow(inComponent: 0)].vetorDatas[0]))
                        
                        var referenceTimeInterval: TimeInterval = 0
                                if let minTimeInterval = (vetorMaterias[pickerMaterias.selectedRow(inComponent: 0)].vetorDatas.map { $0 }).min() {
                                        referenceTimeInterval = minTimeInterval
                                    }
                        
                        
                                    // Define chart xValues formatter
                                    let formatter = DateFormatter()
                        
                                    formatter.dateStyle = .short
                                    formatter.timeStyle = .none
                                    formatter.locale = Locale.current
                                    formatter.dateFormat = "MMM"
                        
                                    let xValuesNumberFormatter = ChartXAxisFormatter(referenceTimeInterval: referenceTimeInterval, dateFormatter: formatter)
                    
                                        grafico.xAxis.valueFormatter = xValuesNumberFormatter
                    }
                        
                }
            }
        }
    }
}
