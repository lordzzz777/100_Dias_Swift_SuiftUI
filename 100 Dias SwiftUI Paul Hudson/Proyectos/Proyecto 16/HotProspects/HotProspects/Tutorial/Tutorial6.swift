//
//  Tutorial6.swift
//  HotProspects
//
//  Created by Esteban Perez Castillejo on 16/9/24.
//

import SwiftUI

struct Tutorial6: View {
    var body: some View {
        
/// Las aplicaciones de iOS han tenido la funcionalidad de "deslizar para eliminar" desde que tengo uso de razón, pero en años más recientes han crecido en potencia para que las filas de la lista puedan tener múltiples botones, a menudo a cada lado de la fila. Obtenemos esta funcionalidad completa en SwiftUI usando el modificador `swipeActions(), que nos permite registrar uno o más botones en uno o ambos lados de una fila de lista.
        
/// Por defecto, los botones se colocarán en el borde derecho de la fila y no tendrán ningún color, por lo que esto mostrará un solo botón gris cuando se deslice de derecha a izquierda:
        List {
/// Puede personalizar el borde donde se colocan sus botones proporcionando un parámetro de borde a su modificador `swipeActions()`, y puede personalizar el color de sus botones, ya sea agregando un modificador `tint()` con un color de su elección, o adjuntando un rol de botón.
            
// Entonces, esto mostrará un botón a cada lado de nuestra fila:
            Text("Taylor Swift")
                .swipeActions {
                    Button("Delete", systemImage: "minus.circle", role: .destructive) {
                        print("Deleting")
                    }
                }
                .swipeActions(edge: .leading) {
                    Button("Pin", systemImage: "pin") {
                        print("Pinning")
                    }
                    .tint(.orange)
                }
        }
    }
}

#Preview {
    Tutorial6()
}
