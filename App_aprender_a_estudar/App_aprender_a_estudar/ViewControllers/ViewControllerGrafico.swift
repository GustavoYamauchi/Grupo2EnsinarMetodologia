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

class ViewControllerGrafico: UIViewController, ChartViewDelegate {
    
    var notas : [Int:[ChartDataEntry]] = [0: [ChartDataEntry(x:1, y:2), ChartDataEntry(x:3, y:1)],1: [ChartDataEntry(x:2, y:3), ChartDataEntry(x:4, y:4)],]
    @IBOutlet weak var grafico: LineChartView!
    
    @IBOutlet weak var sgcCategorias: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        grafico.delegate = self
        grafico.doubleTapToZoomEnabled = false
        
        sgcCategorias.addTarget(self, action: #selector(self.trocarValor), for: .valueChanged)
        
        let set = LineChartDataSet(entries: notas[sgcCategorias.selectedSegmentIndex])
        set.colors = ChartColorTemplates.joyful()
        
        let data = LineChartData(dataSet: set)
        
        grafico.data = data
    }
    
    @objc func trocarValor(){
        grafico.data = LineChartData(dataSet: LineChartDataSet(entries: notas[sgcCategorias.selectedSegmentIndex]))
    }
    
    
}
