//
//  model.swift
//  DiceGames
//
//  Created by Esteban Pérez Castillejo on 8/10/24.
//

import Foundation

struct Model: Codable, Identifiable {
    var id = UUID()
    var sides: [Int]
    
    // Inicializo modelo con un numero determinado de caras
    init(numberOfSides: Int){
        self.sides = Array(1...numberOfSides)
    }
}
