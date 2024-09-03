//
//  Tutorial1.swift
//  AccessibilitySandbox
//
//  Created by Esteban Perez Castillejo on 3/9/24.
//

import SwiftUI

struct Tutorial1: View {
    let pictures = [
        "ales-krivec-15949",
        "galina-n-189483",
        "kevin-horstmann-141705",
        "nicolas-tissot-335096"

    ]
    
    let labels = [
        "Tulips",
        "Frozen tree buds",
        "Sunflowers",
        "Fireworks",
    ]
    
    
    @State private var selectedPicture = Int.random(in: 0...3)
    
    var body: some View {
        Image(pictures[selectedPicture])
            .resizable()
            .scaledToFit()
            .onTapGesture {
                selectedPicture = Int.random(in: 0...3)
            }
            .accessibilityLabel(labels[selectedPicture])
            .accessibilityAddTraits(.isButton)
            .accessibilityRemoveTraits(.isImage)
        /// Con estos cambios en su lugar, nuestra interfaz de usuario funciona mucho mejor: VoiceOver ahora lee una descripción útil del contenido de la imagen, y también hace que los usuarios sepan que la imagen también es un botón.
        
       ///  Dicho esto, agregar y eliminar rasgos no habría sido necesario en absoluto si solo hubiéramos usado un botón normal en lugar de una imagen con un gesto de toque. Esta es la razón por la que es preferible usar botones en lugar de onTapGesture() siempre que sea posible, lo que aquí significa código como este:
        
        Button {
            selectedPicture = Int.random(in: 0...3)
        } label: {
            Image(pictures[selectedPicture])
                .resizable()
                .scaledToFit()
        }
        .accessibilityLabel(labels[selectedPicture])
        
    }
}

#Preview {
    Tutorial1()
}
