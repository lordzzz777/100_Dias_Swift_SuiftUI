//
//  Tutorial2_3.swift
//  LayoutAndGeometry
//
//  Created by Esteban Pérez Castillejo on 4/10/24.
//
//  Efectos ScrollView usando GeometryReader

import SwiftUI

/// Cuando usamos el método frame(in:) de un GeometryProxy, SwiftUI calculará la posición actual de la vista en el espacio de coordenadas que pedimos. Sin embargo, a medida que la vista se mueva, esos valores cambiarán, y SwiftUI se asegurará automáticamente de que GeometryReader se mantenga actualizado.

/// Anteriormente usábamos DragGesture para almacenar un ancho y una altura como una propiedad @State, porque nos permitía ajustar otras propiedades en función de la cantidad de arrastre para crear efectos limpios. Sin embargo, con GeometryReader podemos tomar valores del entorno de una vista de forma dinámica, alimentando en su posición absoluta o relativa en varios modificadores. Aún mejor, puede anidar lectores de geometría si es necesario, de modo que uno pueda leer la geometría para una vista más alta y el otro pueda leer la geometría para algo más abajo en el árbol.

/// Para probar algunos efectos con GeometryReader, podríamos crear un efecto de hélice giratoria creando 50 vistas de texto en una vista de desplazamiento vertical, cada una de las cuales tiene un ancho máximo infinito para que ocupen todo el espacio de la pantalla, y luego apliquen un efecto de rotación 3D basado en su propia posición.

/// Comience haciendo una vista de desplazamiento básica de vistas de texto con diferentes colores de fondo:
struct Tutorial2_3: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
    
    var body: some View {
        ScrollView {
            ForEach(0..<50) { index in
                GeometryReader { proxy in
                    Text("Row #\(index)")
                        .font(.title)
                        .frame(maxWidth: .infinity)
                        .background(colors[index % 7])
                    /// Para aplicar un efecto giratorio de estilo hélice, coloque este `rotation3DEffect()` directamente debajo del modificador `background():
                        .rotation3DEffect(.degrees(proxy.frame(in: .global).minY / 5), axis: (x: 0, y: 1, z: 0))
                }
                .frame(height: 40)
            }
        }
        /// Cuando ejecutes eso hacia atrás, verás que las vistas de texto en la parte inferior de la pantalla están invertidas, las del centro se giran unos 90 grados y las de la parte superior son normales. Más importante aún, a medida que te desplazas, todos giran a medida que te mueves en la vista de desplazamiento.
        
        /// Ese es un buen efecto, pero también es problemático porque las vistas solo alcanzan su orientación natural cuando están en la parte superior, es realmente difícil de leer. Para solucionar esto, podemos aplicar un rotation3DEffect() más complejo que resta la mitad de la altura de la vista principal, pero eso significa usar un segundo GeometryReader para obtener el tamaño de la vista principal:
        GeometryReader { fullView in
            ScrollView {
                ForEach(0..<50) { index in
                    GeometryReader { proxy in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(colors[index % 7])
                            .rotation3DEffect(.degrees(proxy.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                    }
                    .frame(height: 40)
                }
            }
        }
        
        /// Con eso en su lugar, las vistas alcanzarán una orientación natural más cercana al centro de la pantalla, que se verá mejor.
        
        /// Podemos usar una técnica similar para crear rectángulos de desplazamiento al estilo de CoverFlow:
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(1..<20) { num in
                    GeometryReader { proxy in
                        Text("Number \(num)")
                            .font(.largeTitle)
                            .padding()
                            .background(colors[num % 7])
                            .rotation3DEffect(.degrees(-proxy.frame(in: .global).minX) / 8, axis: (x: 0, y: 1, z: 0))
                            .frame(width: 200, height: 200)
                            .shadow(radius: 10, y: 10)
                    }
                    .frame(width: 200, height: 200)
                }
            }
        }
    }
}

#Preview {
    Tutorial2_3()
}
