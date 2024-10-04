//
//  Tutorial2_4.swift
//  LayoutAndGeometry
//
//  Created by Esteban Pérez Castillejo on 4/10/24.
//
//  Efectos ScrollView usando visualEffect() y scrollTargetBehavior()
import SwiftUI

/// Anteriormente vimos cómo usar GeometryReader para crear efectos variables basados en dónde se encuentra una vista en la pantalla. Ese código funciona bien, y ciertamente lo verás en muchas aplicaciones, pero SwiftUI proporciona algunas alternativas útiles que pueden ser mucho más fáciles.

/// Primero, veamos de nuevo algún código anterior: esto crea un efecto simple de estilo CoverFlow, donde podemos deslizar horizontalmente para ver las vistas moviéndose en el espacio 3D:
struct Tutorial2_4: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(1..<20) { num in
                    GeometryReader { proxy in
                        Text("Number \(num)")
                            .font(.largeTitle)
                            .padding()
                            .background(.red)
                            .rotation3DEffect(.degrees(-proxy.frame(in: .global).minX) / 8, axis: (x: 0, y: 1, z: 0))
                            .frame(width: 200, height: 200)
                    }
                    .frame(width: 200, height: 200)
                }
            }
        }
        
        /// Ese código utiliza GeometryReader para leer la posición de cada vista en la vista de desplazamiento, pero hemos necesitado añadir un ancho y alto explícitos para que nuestro GeometryReader se expanda automáticamente para ocupar todo el espacio disponible.
        
        /// SwiftUI nos da una alternativa llamada visualEffect(), y tiene un propósito muy específico y una restricción muy específica: nos permite aplicar efectos que cambian la forma en que algo se ve, lo que en la práctica significa que no puede hacer nada que afecte la posición real del diseño o el marco de una vista.
        
        /// Este modificador funciona de una manera muy interesante: le pasamos un cierre para que se ejecute, y se nos dará el contenido que estamos modificando, así como un GeometryProxy para ello. Ese contenido que estamos modificando es nuestra vista, pero no podemos simplemente aplicar cualquier modificador que queramos como lo haríamos normalmente; de nuevo, no podemos hacer nada que afecte la posición del diseño de la vista.
        
        /// Afortunadamente, eso todavía nos deja muchos modificadores para usar, incluidos algunos que podrían sorprenderte: podemos usar rotationEffect(), rotation3DEffect() e incluso offset(), porque aunque afectan la forma en que se dibujan las vistas, no cambian el marco de la vista.
        
        /// Entonces, podemos reescribir nuestro código usando visualEffect() así:
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(1..<20) { num in
                    Text("Number \(num)")
                        .font(.largeTitle)
                        .padding()
                        .background(.red)
                        .frame(width: 200, height: 200)
                        .visualEffect { content, proxy in
                            content
                                .rotation3DEffect(.degrees(-proxy.frame(in: .global).minX) / 8, axis: (x: 0, y: 1, z: 0))
                        }

                }
            }.scrollTargetLayout()
        }.scrollTargetBehavior(.viewAligned)
    }
}

#Preview {
    Tutorial2_4()
}
