//
//  ChartXAxisFormatter.swift
//  App_aprender_a_estudar
//
//  Created by Gustavo Yamauchi on 06/05/20.
//  Copyright © 2020 Rodrigo Ryo Aoki. All rights reserved.
//

import Foundation
import Charts

class ChartXAxisFormatter: NSObject {
    var dateFormatter: DateFormatter?
    var referenceTimeInterval: TimeInterval?

    convenience init(referenceTimeInterval: TimeInterval, dateFormatter: DateFormatter) {
        self.init()
        self.referenceTimeInterval = referenceTimeInterval
        self.dateFormatter = dateFormatter
    }
}


extension ChartXAxisFormatter: IAxisValueFormatter {

    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        guard let dateFormatter = dateFormatter,
        let referenceTimeInterval = referenceTimeInterval
        else {
            return ""
        }

        let date = Date(timeIntervalSince1970: referenceTimeInterval)
        return dateFormatter.string(from: date)
    }
}
