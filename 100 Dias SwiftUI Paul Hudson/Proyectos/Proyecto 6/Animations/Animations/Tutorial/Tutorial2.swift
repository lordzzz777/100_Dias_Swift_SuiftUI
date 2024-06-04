//
//  Tutorial2.swift
//  Animations
//
//  Created by Esteban Perez Castillejo on 4/6/24.
//

/// El modificador animation() se puede aplicar a cualquier enlace SwiftUI, lo que hace que el valor se anime entre su valor actual y el nuevo. Esto incluso funciona si los datos en cuestión no son realmente algo que suene como si pudieran ser animados, como un booleano: puedes imaginarte mentalmente animando de 1.0 a 2.0 porque podríamos hacer 1.05, 1.1, 1.15, y así suces, pero pasar de "falso" a "verdadero" suena como si no hubiera espacio para entre valores.

/// Esto se explica mejor con un poco de código de trabajo para mirar, así que aquí hay una vista con un VStack, un Stepper y un botón:

import SwiftUI

struct Tutorial2: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        print(animationAmount)
        return VStack {
            
            /// Debido a que tenemos algún código de no vista allí, necesitamos agregar retorno antes de VStack para que Swift entienda qué parte es la vista que se está devolviendo. Pero añadir print(animationAmount) es importante, y para ver por qué me gustaría que ejecutaras el programa de nuevo e intentaras manipular el paso a paso.
            
            /// Lo que deberías ver es que imprime 2.0, 3.0, 4.0, y así suces. Al mismo tiempo, el botón se está escalando hacia arriba o hacia abajo sin problemas, no solo salta directamente a la escala 2, 3 y 4. Lo que realmente está sucediendo aquí es que SwiftUI está examinando el estado de nuestra visión antes de los cambios de enlace, examinando el estado objetivo de nuestras opiniones después de los cambios de unión, y luego aplicando una animación para ir del punto A al punto B.
            
            /// Esta es la razón por la que podemos animar un cambio booleano: Swift no está inventando de alguna manera nuevos valores entre falso y verdadero, sino que solo está animando los cambios de vista que se producen como resultado del cambio.
            
            /// Estas animaciones de enlace utilizan un modificador de animación () similar que usamos en las vistas, por lo que puedes ir a la ciudad con modificadores de animación si quieres:
            
            Stepper("Scale amount", value: $animationAmount.animation(), in: 1...10)
            
            /// Consejo: Con esta variante del modificador animation(), no necesitamos especificar qué valor estamos observando para los cambios, ¡está literalmente unido al valor que debería ver!
            
           /// Estas animaciones vinculantes giran efectivamente las tablas en animaciones implícitas: en lugar de establecer la animación en una vista y animarla implícitamente con un cambio de estado, ahora no establecemos nada en la vista y la animamos explícitamente con un cambio de estado. En el primero, el cambio de estado no tiene idea de que desencadenará una animación, y en el segundo, la vista no tiene idea de que será animada; tanto el trabajo como ambos son importantes.
            
            Stepper("Scale amount 2", value: $animationAmount.animation(
                .easeInOut(duration: 1)
                .repeatCount(3, autoreverses: true)
            ), in: 1...10)
            
            Spacer()
            
            Button("Tap Me") {
                animationAmount += 1
            }
            .padding(40)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .scaleEffect(animationAmount)
        }.padding()
    }
}

#Preview {
    Tutorial2()
}
