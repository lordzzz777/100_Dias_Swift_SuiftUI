//
//  Totorial4.swift
//  Animations
//
//  Created by Esteban Perez Castillejo on 5/6/24.
//

import SwiftUI


/// Anteriormente vimos cómo es importante el orden de los modificadores. 
/// Entonces, si escribimos un código como este:
struct Totorial4: View {
    @State private var enabled = false
    @State private var enabled2 = false
    
    var body: some View {
        // boton modelo
        Button("Tap Me") {
            // do nothing
        }
        .background(.blue)
        .frame(width: 200, height: 200)
        .foregroundStyle(.white)
        
        // cambiando "background", y poniendolo detras de "frame", el resultado cambia
        Button("Tap Me") {
            // do nothing
        }
        .frame(width: 100, height: 100)
        .background(.blue)
        .foregroundStyle(.white)
        
        // el orden de los modificadores importa, porque SwiftUI envuelve las vistas con modificadores en el orden en que se aplican.

       // El segundo concepto es que podemos aplicar un modificador de animación() a una vista para que anime implícitamente los cambios.
        
        Button("Tap Me") {
            enabled.toggle()
        }
        .frame(width: 100, height: 100)
        .background(enabled ? .blue : .red)
        .foregroundStyle(.white)
        .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
        .animation(.default, value: enabled)
        
        /// Y ahora, cuando ejecutas el código, tanto el color de fondo como la forma del clip se animan.
        
        ///Por lo tanto, el orden en el que aplicamos las animaciones es importante: solo los cambios que se producen antes de que se anime el modificador animation().

        ///Ahora, para la parte divertida: si aplicamos varios modificadores de animación(), cada uno controla todo antes hasta la siguiente animación. Esto nos permite animar los cambios de estado de todo tipo de maneras diferentes en lugar de de manera uniforme para todas las propiedades.

       /// Por ejemplo, podríamos hacer que el cambio de color ocurra con la animación predeterminada, pero usar un resorte para la forma del clip:
        
        Button("Tap Me") {
            enabled2.toggle()
        }
        .frame(width: 100, height: 100)
        .background(enabled2 ? .blue : .red)
        .animation(.default, value: enabled2)
        .foregroundStyle(.white)
        .clipShape(.rect(cornerRadius: enabled2 ? 60 : 0))
        .animation(.spring(duration: 1, bounce: 0.6), value: enabled2)
        
      ///  Puedes tener tantos modificadores de animation() como necesites para construir tu diseño, lo que nos permite dividir un cambio de estado en tantos segmentos como necesitemos.

     ///  Para un control aún mayor, es posible desactivar las animaciones por completo pasando nil al modificador. Por ejemplo, es posible que desee que el cambio de color ocurra de inmediato, pero la forma del clip conserve su animación, en cuyo caso escribiría esto:
        
        Button("Tap Me") {
            enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? .blue : .red)
        .animation(nil, value: enabled)
        .foregroundStyle(.white)
        .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
        .animation(.spring(duration: 1, bounce: 0.6), value: enabled)
    }
    
    
}

#Preview {
    Totorial4()
}
