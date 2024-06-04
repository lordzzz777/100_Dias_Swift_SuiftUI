//
//  Tutorial3.swift
//  Animations
//
//  Created by Esteban Perez Castillejo on 4/6/24.
//

import SwiftUI

/// Ahora, sin embargo, estamos siendo explícitos que queremos que una animación ocurra cuando se produce algún cambio de estado arbitrario: no está unida a un enlace, y no está adjunta a una vista, solo somos nosotros pidiendo explícitamente que se produzca una animación en particular debido a un cambio de estado.
/// Para demostrar esto, volvamos de nuevo a un ejemplo de botón simple:

struct Tutorial3: View {
    /// Cuando se toque ese botón, vamos a hacer que gire con un efecto 3D. Esto requiere otro nuevo modificador, rotation3DEffect(), al que se le puede dar una cantidad de rotación en grados, así como un eje que determina cómo gira la vista. Piensa en este eje como un pincho a través de tu vista:
     
    /// Si pinchamos la vista a través del eje X (horizontalmente), entonces podrá girar hacia adelante y hacia atrás.

    /// Si ensartamos la vista a través del eje Y (verticamente), podrá girar a izquierda y derecha.

    /// Si pinchamos la vista a través del eje Z (profundidad), entonces podrá girar a izquierda y derecha.

    /// Hacer este trabajo requiere algún estado que podamos modificar, y los grados de rotación se especifican como un Doble. Por lo tanto, por favor, agregue esta propiedad ahora:
    @State private var animationAmount = 0.0
    
    
    var body: some View {
       
        Button("Tap Me") {
            withAnimation {
              // animationAmount += 360
                
                /// Ejecuta ese código ahora y creo que te impresionará lo bien que se ve: cada vez que pulsas el botón, gira en el espacio 3D, y fue muy fácil de escribir. Si tienes tiempo, experimenta un poco con los ejes para que puedas entender realmente cómo funcionan. En caso de que tuvieras curiosidad, puedes usar más de un eje a la vez.
                
               /// A withAnimation() se le puede dar un parámetro de animación, utilizando las mismas animaciones que puedes usar en otro lugar de SwiftUI. Por ejemplo, podríamos hacer que nuestro efecto de rotación use una animación de primavera usando una llamada withAnimation() como esta:
                withAnimation(.spring(duration: 1, bounce: 0.5)) {
                    animationAmount += 360
                }
            }
               }
               .padding(50)
               .background(.red)
               .foregroundStyle(.white)
               .clipShape(.circle)
        /// A continuación, le vamos a pedir al botón que gire por grados de cantidad de animación a lo largo de su eje Y, lo que significa que girará a izquierda y derecha. Añade este modificador al botón ahora:
               .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))

    }
}

#Preview {
    Tutorial3()
}
