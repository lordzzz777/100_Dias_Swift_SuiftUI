//
//  Tutorial2.swift
//  AccessibilitySandbox
//
//  Created by Esteban Perez Castillejo on 3/9/24.
//

import SwiftUI

struct Tutorial2: View {
    var body: some View {
        Image(decorative: "character")
            .resizable()
            .scaledToFit()
            .frame(width: 100)
        
        /// Para todas las vistas, imágenes o de otro tipo, puede obtener el mismo resultado utilizando el modificador `.accessibilityHidden()`, que hace que cualquier vista sea completamente invisible para el sistema de accesibilidad:
        Image(.character)
            .resizable()
            .scaledToFit()
            .frame(width: 100)
            .accessibilityHidden(true)

        
        /// La última forma de ocultar el contenido de VoiceOver es a través de la agrupación, que nos permite controlar cómo el sistema lee varias vistas que están relacionadas. Como ejemplo, considere este diseño:
        VStack {
            Text("Your score is")
            Text("1000")
                .font(.title)
        }
        
        /// VoiceOver ve eso como dos vistas de texto no relacionadas, por lo que leerá "Tu puntuación es" o "1000" dependiendo de lo que el usuario haya seleccionado. Ambos son inútiles, que es donde entra el modificador .accessibilityElement(children:): podemos aplicarlo a una vista principal y pedirle que combine hijos en un solo elemento de accesibilidad.
        
        /// Por ejemplo, esto hará que ambas vistas de texto se lean juntas, con una breve pausa entre ellas:
        VStack {
            Text("Your score is")
            Text("1000")
                .font(.title)
        }
        .accessibilityElement(children: .combine)
        
        /// Eso funciona muy bien cuando las vistas secundarias contienen información separada, pero en nuestro caso las hijas realmente deberían leerse como una sola entidad. Por lo tanto, la mejor solución aquí es usar .accessibilityElement(children: .ignore) para que las vistas secundarias sean invisibles para VoiceOver, y luego proporcionar una etiqueta personalizada al padre, como esta:
        VStack {
            Text("Your score is")
            Text("1000")
                .font(.title)
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Your score is 1000")
    }
}

#Preview {
    Tutorial2()
}
