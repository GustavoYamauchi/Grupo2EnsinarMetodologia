//
//  Materia.swift
//  App_aprender_a_estudar
//
//  Created by Gustavo Yamauchi on 30/04/20.
//  Copyright © 2020 Rodrigo Ryo Aoki. All rights reserved.
//

import Foundation
import Charts


public class Materia{
    public var nome: String?
    public var vetorNotas = [ChartDataEntry]()
        
    init(nome: String){
        self.nome = nome
    }
    
    
    func addNota(data: Double, nota: Double){ //recebe a nota e a data, adiciona no array de notas
        let nota = ChartDataEntry(x: data, y: nota)
        self.vetorNotas.append(nota)
    }
    
    func deletarNota(i: Int){ //recebe a posição do array que quer remover
        var j = i
        while(j < self.vetorNotas.count-1){
            self.vetorNotas[j] = self.vetorNotas[j+1]
            j += 1
        }
    }
    
    func salvar(materia: Materia){
        UserDefaults.standard.set(materia.vetorNotas, forKey: materia.nome!)
    }
    
    func salvarNomeMaterias(materia: Materia){
        
        var vetorNomesMaterias = [String]()
        vetorNomesMaterias = UserDefaults.standard.object(forKey: "Nome das Materias") as! [String]
        vetorNomesMaterias.append(materia.nome!)
    }
    
    func restaurarMateria(){
        if(UserDefaults.standard.object(forKey: self.nome!) as? [ChartDataEntry] != nil){  //Checa se o array existe
            self.vetorNotas = UserDefaults.standard.object(forKey: self.nome!) as! [ChartDataEntry]
        }
    }
}

/*
var vetorMaterias = [Materia]()

func rec_dados_materias(){
    var vetorNomes = [String]?
    vetorMaterias.removeAll()

    vetorNomes = UserDefaults.standard.object(forKey: "Nome das Materias") as! [String]
    var i = 0
 
    while(i < vetorNomes.count){
        let materia = Materia(vetorNomes[i]).restaurarMateria()
        vetorMaterias.append(materia)
        i += 1
    }
 }
 */
