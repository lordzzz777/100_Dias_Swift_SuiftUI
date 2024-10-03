//
//  Tutorial2.swift
//  LayoutAndGeometry
//
//  Created by Esteban Pérez Castillejo on 3/10/24.
//
//  Alineación y guías de alineación

import SwiftUI

struct Tutorial2: View {
    var body: some View {
        ScrollView{
            // Ejemplo 1
            Text("Live long and prosper")
                .frame(width: 300, height: 300)
            /// Este código coloca la vista en la esquina superior
            /// izquierda cuando se ejecuta en un entorno de izquierda a derecha
            /// `.frame(width: 300, height: 300, alignment: .topLeading)`
            
            /// La siguiente opción es usar el parámetro de alineación de una pila. Por ejemplo, aquí hay cuatro vistas de texto de diferentes tamaños dispuestas en un HStack:
            
            // Ejemplo 2
            
            /// No hemos especificado una alineación allí, por lo que estarán centrados por defecto. Eso no se ve muy bien, así que podrías pensar en alinearlos todos en un borde para obtener una línea más limpia, como esta:
            HStack(alignment: .bottom){
                Text("Live")
                    .font(.caption)
                Text("long")
                Text("and")
                    .font(.title)
                Text("prosper")
                    .font(.largeTitle)
            }
            
            // Ejemplo 3
            
            /// Afortunadamente, SwiftUI tiene dos alineaciones especiales que alinean el texto en la línea de base del primer hijo o del último hijo. Esto hará que todas las vistas de una pila se alineen en una sola línea de base unificada, independientemente de su fuente:
            HStack(alignment: .lastTextBaseline){
                Text("Live")
                    .font(.caption)
                Text("long")
                Text("and")
                    .font(.title)
                Text("prosper")
                    .font(.largeTitle)
            }
            
            // Ejemplo 4
            
            /// Avanzando, para un control más fino, podemos personalizar lo que significa "alineación" para cada vista individual. Para tener una idea realmente buena de cómo funciona esto, vamos a empezar con este código:
            
            VStack(alignment: .leading) {
                Text("Hello, world!")
                Text("This is a longer line of text")
            }
            .background(.red)
            .frame(width: 400, height: 400)
            .background(.blue)
            
            // Ejemplo 5
            
            /// SwiftUI nos proporciona el modificador `alignmentGuide()` solo para este propósito. Esto requiere dos parámetros: la guía que queremos cambiar y un cierre que devuelve una nueva alineación. El cierre recibe un objeto `ViewDimensions` que contiene el ancho y la altura de su vista, junto con la capacidad de leer sus diversos bordes.
            
            /// De forma predeterminada, la guía de alineación `.leading` para una vista es su guía de alineación principal - Sé que suena obvio, pero es efectivamente equivalente a esto:
            
            VStack(alignment: .leading) {
                Text("Hello, world!")
                    .alignmentGuide(.leading) { d in d[.leading] }
                Text("This is a longer line of text")
            }.padding()
            
            /// Podríamos reescribir esa guía de alineación para usar el borde final de la vista para su guía de alineación inicial, así:
            VStack(alignment: .leading) {
                Text("Hello, world!")
                    .alignmentGuide(.leading) { d in d[.trailing] }
                Text("This is a longer line of text")
            }
            
            // Ejemplo 8
            
            /// Y ahora verás por qué agregué colores: la primera vista de texto se moverá hacia la izquierda para que su borde derecho se encuentre directamente sobre el borde izquierdo de la vista de abajo, el `VStack` se expandirá para contenerlo, y todo seguirá centrado dentro del marco azul.
            
            /// Este resultado es diferente al de usar el modificador `offset()`: si compensa un texto, sus dimensiones originales en realidad no cambian, a pesar de que la vista resultante se representa en una ubicación diferente. Si hubiéramos desplazado la primera vista de texto en lugar de cambiar su guía de alineación, el `VStack` no se expandiría para contenerla.
            
            /// Aunque el cierre de la guía de alineación pasa las dimensiones de su vista, no necesita usarlas si no lo desea: puede devolver un número codificado o crear algún otro cálculo. Por ejemplo, esto crea un efecto escalonado para 10 vistas de texto multiplicando su posición por -10:
            
            VStack(alignment: .leading) {
                ForEach(0..<10) { position in
                    Text("Number \(position)")
                        .alignmentGuide(.leading) { _ in Double(position) * -10 }
                }
            }
            .background(.red)
            .frame(width: 400, height: 400)
            .background(.blue)
        }
    }
}

#Preview {
    Tutorial2()
}
