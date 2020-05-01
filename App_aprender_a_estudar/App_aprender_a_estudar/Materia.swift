//
//  Materia.swift
//  App_aprender_a_estudar
//
//  Created by Gustavo Yamauchi on 30/04/20.
//  Copyright © 2020 Rodrigo Ryo Aoki. All rights reserved.
//

import Foundation
import Charts


struct Materia: Codable {
    var nome: String
    var notas: [ChartDataEntry]
}

