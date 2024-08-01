//
//  AddingHapticEffects.swift
//  CupcakeCorner
//
//  Created by Esteban Perez Castillejo on 1/8/24.
//

import SwiftUI

// Efectos de vibración
struct AddingHapticEffects: View {
    @State private var counter = 0
    
    var body: some View {
        Button("Tap Count: \(counter)"){
            counter += 1
        }
    /// Efecto háptico que se activa cada vez que se presiona el botón
        .sensoryFeedback(.increase, trigger: counter)
        
    /// Colisión suaeve entre dos objetos blandos:
        .sensoryFeedback(.impact(flexibility: .soft, intensity: 0.5), trigger: counter)
        
    /// Colisión intensa entre dos objetos pesados:
        .sensoryFeedback(.impact(weight: .heavy, intensity: 1), trigger: counter)

    }
}

#Preview {
    AddingHapticEffects()
}
