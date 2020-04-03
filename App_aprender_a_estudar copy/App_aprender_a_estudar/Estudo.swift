//
//  Estudo.swift
//  App_aprender_a_estudar
//
//  Created by Rodrigo Ryo Aoki on 31/03/20.
//  Copyright © 2020 Rodrigo Ryo Aoki. All rights reserved.
//

import Foundation

public class Estudo{
    public var Nome: String?
    public var Descricao: String?
    
    init(Nome: String, Descricao: String) {
        self.Nome = Nome
        self.Descricao = Descricao        
    }
    
    func getNome() -> String {
        return self.Nome!
    }
    
    func getDescricao() -> String {
        return self.Descricao!
    }
    
    func save() {
        let filename = Nome!
        let documentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileURL = documentDirURL.appendingPathComponent(filename).appendingPathExtension("txt")
              print("FilePath: \(fileURL.path)")
         
        let str = self.Nome! + " ˆ%$ " + self.Descricao!
        
        do {
            try str.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
            
        } catch let error as NSError{
            print("Failed writing to URL: \(fileURL), Error: " + error.localizedDescription)
        }
       
    }
    
    func restore(file: String) {
        self.Nome = file
        
        let fileName = file
        let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        
        let fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
        print("FilePath: \(fileURL.path)")
        
        var readString = "" // Used to store the file contents
        do {
            // Read the file contents
            readString = try String(contentsOf: fileURL)
        } catch let error as NSError {
            print("Failed reading from URL: \(fileURL), Error: " + error.localizedDescription)
        }
         
        //let arrayOfRead = readString.components(separatedBy: " ˆ%$ ")
        
        //self.Descricao = arrayOfRead[1]
    }
    
    func save_filename(i: Int){ //Não está salvando corretamente
        var j: Int = 1
        let fileName = "Nomes dos Arquivos"
        let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        
        let fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
        print("FilePath: \(fileURL.path)")
    
        
        var readString = "" // Used to store the file contents
        do {
            // Read the file contents
            //readString = try String(contentsOf: fileURL)
            readString = try String(contentsOf: fileURL)
        } catch let error as NSError {
            print("Failed reading from URL: \(fileURL), Criando: " + error.localizedDescription)
        }
        print("\n"+readString) //Para olhar se está registrando e o que está sendo lido
        let arrayOfRead = readString.components(separatedBy: "\n")
        
        var writeString = String(i) + "\n"
        
        while(j <= i){
            writeString = writeString + arrayOfRead[j]+"\n"
            j += 1
        }
        
        writeString = writeString + self.Nome! + "\n"
        
        print(writeString)
        do {
            try writeString.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print("Failed writing to URL: \(fileURL), Error: " + error.localizedDescription)
        }
    }
}
