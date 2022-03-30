//
//  Automovil.swift
//  Poo
//
//  Created by Carlos Rios on 29/03/22.
//

import Foundation

class Automovil {
    var modelo = ""
    var color = "Negro"
    let numeroLlantas = 4
    var precio:Double = 0
    
    init(modelo:String, color: String, precio:Double) {
        self.modelo = modelo
        self.color = color
        self.precio = precio
    }
    
    func encender() -> Bool {
        return true
    }
    func apagar() -> Bool {
        return false
    }
}
