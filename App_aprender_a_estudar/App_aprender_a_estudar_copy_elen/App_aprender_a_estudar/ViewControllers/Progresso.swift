//
//  Progresso.swift
//  App_aprender_a_estudar
//
//  Created by Ellen Couto on 14/04/20.
//  Copyright © 2020 Rodrigo Ryo Aoki. All rights reserved.
//

import Foundation
import UIKit
import Charts

class Progresso: UIViewController {
  
    @IBOutlet weak var TextBox: UITextField!
    @IBOutlet weak var ChartView: BarChartView!
    var numbers : [Double] = []
    
    @IBOutlet weak var btnAdd: UIButton!
    
//        enum Segues {
//        static let toChart = "toChart"
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnAdd.addTarget(self, action: #selector(valorTextBox), for: .touchUpInside)
    }
//   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//    if segue.identifier == Segues.toChart{
//        let destVC = segue.destination as! Chart
//        destVC.view.backgroundColor = .blue
//    }
      
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    func updateGraph(){
        var barChartEntry = [ChartDataEntry]()

        for i in 0..<numbers.count {
            let value = ChartDataEntry(x: Double(i), y: Double(i))
            barChartEntry.append(value)
        }
        let bar1 = BarChartDataSet(entries: barChartEntry, label: "Number")

        bar1.colors = [NSUIColor.blue]

        let data = BarChartData()
        data.addDataSet(bar1)

        ChartView.data = data
        ChartView.chartDescription?.text = "meu chart do caraio"
 
    }
    @objc func valorTextBox(){
        let input = Double(TextBox.text!)
        print(TextBox.text)
        numbers.append(input!)
               updateGraph()
    }
}

