//
//  Card.swift
//  Flashzilla
//
//  Created by Esteban Pérez Castillejo on 24/9/24.
//

import SwiftUI

struct Card: Identifiable, Codable, Equatable {
    var id = UUID() // Identificador único
    var prompt: String
    var answer: String
    
    static let example = Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
}
