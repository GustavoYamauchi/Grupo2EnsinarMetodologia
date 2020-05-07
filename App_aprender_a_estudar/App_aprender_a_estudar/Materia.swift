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
    public var vetorNotas = [Double]()
    public var vetorDatas = [Double]()
        
        
    init(nome: String){
        self.nome = nome
    }
    
    
    func addNota(data: Double, nota: Double){ //recebe a nota e a data, adiciona no array de notas
        self.vetorNotas.append(nota)
        self.vetorDatas.append(data)
    }
    
    func deletarNota(i: Int){ //recebe a posição do array que quer remover
        var j = i
        while(j < self.vetorNotas.count-1){
            self.vetorNotas[j] = self.vetorNotas[j+1]
            self.vetorDatas[j] = self.vetorDatas[j+1]
            j += 1
        }
    }
    
    func salvar(){
        UserDefaults.standard.set(self.vetorNotas, forKey: self.nome! + "-notas")
        UserDefaults.standard.set(self.vetorDatas, forKey: self.nome! + "-datas")
    }
    
    func salvarNomeMaterias(){
        var vetorNomesMaterias = [String]()
        vetorNomesMaterias = UserDefaults.standard.object(forKey: "Nome das Materias") as! [String]
        vetorNomesMaterias.append(self.nome!)
        UserDefaults.standard.set(vetorNomesMaterias, forKey: "Nome das Materias")
    }

    
    func restaurarMateria() -> Materia{
        if(UserDefaults.standard.object(forKey: self.nome! + "-notas") != nil || UserDefaults.standard.object(forKey: self.nome! + "-datas") != nil){  //Checa se o array existe
            self.vetorNotas = UserDefaults.standard.object(forKey: self.nome! + "-notas") as! [Double]
            self.vetorDatas = UserDefaults.standard.object(forKey: self.nome! + "-datas") as! [Double]
        }
        
        return self
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
