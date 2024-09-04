//
//  Tutorial4.swift
//  AccessibilitySandbox
//
//  Created by Esteban Perez Castillejo on 4/9/24.
//

import SwiftUI

struct Tutorial4: View {
    var body: some View {
/// La entrada de voz permite a los usuarios activar los controles a través de nombres o números, y los nombres se generan automáticamente en función de lo que presenta. Aquí hay un ejemplo trivial:
        Button("Tap Me") {
            print("Button tapped")
        }.padding()
        
/// Debido a que eso tiene "Tácame" ahí mismo en la pantalla, se puede activar diciendo "Presiona Tap Me". Eso está bien, pero las cosas a menudo son más complicadas.
        
/// Por ejemplo, digamos que tenías botones con los nombres de varios presidentes, como este:
        Button("John Fitzgerald Kennedy") {
            print("Button tapped")
        }.padding()
        
/// Eso funcionará muy bien como "Tap John Fitzgerald Kennedy", pero ¿no sería genial reconocer también "Tap Kennedy" o tal vez incluso "Tap JFK"? ¿Qué tal reconocer a los tres?
        
/// Aquí es donde SwiftUI necesita un poco de ayuda adicional de nosotros usando el modificador `accessibilityInputLabels()`. Esto acepta una matriz de cadenas que se pueden conectar a nuestro botón, para que el usuario pueda activarlo de varias maneras. Entonces, para activar el botón con tres frases diferentes, usaríamos esto:
        
        Button("John Fitzgerald Kennedy") {
            print("Button tapped")
        }
        .accessibilityInputLabels(["John Fitzgerald Kennedy", "Kennedy", "JFK"])
    }
}

#Preview {
    Tutorial4()
}
