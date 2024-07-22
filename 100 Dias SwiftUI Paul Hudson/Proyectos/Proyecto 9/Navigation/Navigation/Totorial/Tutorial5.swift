//
//  Tutorial5.swift
//  Navigation
//
//  Created by Esteban Perez Castillejo on 22/7/24.
//

import SwiftUI

struct Tutorial5: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            Text("Cómo hacer que un NavigationStack vuelva a su vista raíz mediante programación").font(.system(size: 30).bold()).padding()
            DetailView2(number: 0, path: $path).padding().background(.green).clipShape(.rect(cornerRadius: 8))
                .navigationDestination(for: Int.self) { i in
                    DetailView2(number: i, path: $path)
                }
            
            ScrollView{
                Text("""
Es común tener varios niveles de profundidad en una pila de navegación, y luego decidir que quieres volver al principio. Por ejemplo, tal vez su usuario esté haciendo un pedido y se haya abierto camino a través de las pantallas que muestran su cesta, pidiendo detalles de envío, pidiendo detalles de pago, luego confirmando el pedido, pero cuando hayan terminado, desea volver al principio, volver a la vista raíz de su NavigationStack.

Para demostrar esto, podemos crear una pequeña caja de arena que puede impulsar nuevas vistas sin cesar mediante la generación de nuevos números aleatorios cada vez.

En primer lugar, aquí está nuestro DetailView que muestra su número actual como su título, y tiene un botón que presiona un nuevo número aleatorio cada vez que se presiona:
""").padding()
            }

        }
    }
}

struct DetailView2: View {
    var number: Int
    @Binding var path: NavigationPath
    var body: some View {
        NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
            .toolbar {
                Button("Home") {
                    path = NavigationPath()
                }
            }
    }
}


#Preview {
    Tutorial5()
}
