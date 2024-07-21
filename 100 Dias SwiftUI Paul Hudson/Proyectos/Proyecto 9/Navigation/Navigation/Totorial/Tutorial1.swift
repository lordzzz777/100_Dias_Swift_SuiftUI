//
//  Tutorial1.swift
//  Navigation
//
//  Created by Esteban Perez Castillejo on 21/7/24.
//

import SwiftUI

struct Tutorial1: View {
    var body: some View {
        NavigationStack {
            NavigationLink("Tap Me") {
                DetailView(number: 556)
            }
            
          /// Ahora verás que se están creando muchas instancias de DetailView a medida que te desplazas, a menudo más de una vez. Esto está haciendo que Swift y SwiftUI hagan mucho más trabajo del necesario, por lo que cuando se trata de datos dinámicos, cuando tienes muchos números enteros diferentes para mostrar de la misma manera, por ejemplo, SwiftUI nos da una mejor solución: adjuntar un valor de presentación a nuestro enlace de navegación.
            
          ///  Echemos un vistazo a eso a continuación...

            List(0..<1000) { i in
                NavigationLink("Tap Me") {
                    DetailView(number: i)
                }
            }
        }
    }
}


// Vista de detalles
struct DetailView: View {
    var number: Int
    
    var body: some View {
        NavigationStack{
            NavigationLink("Tap Me"){
                Text("Detail View \(number)")
            }
        }
    }
    init(number: Int) {
        self.number = number
        print("Creating detail view \(number)")
    }
}

#Preview {
    Tutorial1()
}
