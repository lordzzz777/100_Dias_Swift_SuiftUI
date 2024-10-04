//
//  Tutorial2_2.swift
//  LayoutAndGeometry
//
//  Created by Esteban Pérez Castillejo on 4/10/24.
//
//  Comprender los marcos y las coordenadas dentro de GeometryReader

import SwiftUI

/// `GeometryReader` de SwiftUI nos permite usar su tamaño y coordenadas para determinar el diseño de una vista secundaria, y es la clave para crear algunos de los efectos más notables en SwiftUI.

/// Siempre debe tener en cuenta el sistema de diseño de tres pasos de SwiftUI cuando trabaje con `GeometryReader`: el padre propone un tamaño para el hijo, el hijo lo usa para determinar su propio tamaño y el padre lo usa para colocar al hijo adecuadamente.

/// En su uso más básico, lo que hace `GeometryReader` es dejarnos leer el tamaño que fue propuesto por el padre, y luego usarlo para manipular nuestra vista. Por ejemplo, podríamos usar `GeometryReader` para hacer que una vista de texto tenga el 90% de todo el ancho disponible, independientemente de su contenido:


struct Tutorial2_2: View {
    var body: some View {
        GeometryReader { proxy in
            Text("Hello, World!")
                .frame(width: proxy.size.width * 0.9)
                .background(.red)
        }
        /// Ese parámetro proxy que entra es un `GeometryProxy`, y contiene el tamaño propuesto, cualquier inserción de área segura que se haya aplicado, además de un método para leer los valores de marco que veremos en un momento.
        
        /// `GeometryReader` tiene un efecto secundario interesante que podría atraparte al principio: la vista que se devuelve tiene un tamaño preferido flexible, lo que significa que se expandirá para ocupar más espacio según sea necesario. Puedes ver esto en acción si colocas el `GeometryReader` en un `VStack` y luego pones algo más de texto debajo de él, como este:
        
        VStack {
            GeometryReader { proxy in
                Text("Hello, World!")
                    .frame(width: proxy.size.width * 0.9, height: 40)
                    .background(.red)
            }

            Text("More text")
                .background(.blue)
        }
        /// Verás que "Más texto" se empuja hasta la parte inferior de la pantalla, porque el GeometryReader ocupa todo el espacio restante. Para verlo en acción, agregue background(.green) como modificador al GeometryReader y verá lo grande que es. Nota: Este es un tamaño preferido, no un tamaño absoluto, lo que significa que sigue siendo flexible dependiendo de su padre.
        
        /// Cuando se trata de leer el marco de una vista, GeometryProxy proporciona un método frame(in:) en lugar de propiedades simples. Esto se debe a que el concepto de "marco" incluye coordenadas X e Y, que no tienen ningún sentido de forma aislada: ¿quieres las coordenadas X e Y absolutas de la vista, o sus coordenadas X e Y en comparación con su padre?

        /// SwiftUI llama a estas opciones espacios de coordenadas, y esos dos en particular se llaman espacio global (mide el marco de nuestra vista en relación con toda la pantalla) y el espacio local (mide el marco de nuestra vista en relación con su padre). También podemos crear espacios de coordenadas personalizados adjuntando el modificador coordinateSpace() a una vista; cualquier hijo de eso puede leer su marco en relación con ese espacio de coordenadas.

        /// Para demostrar cómo funcionan los espacios de coordenadas, podríamos crear algunas vistas de ejemplo en varias pilas, adjuntar un espacio de coordenadas personalizado a la vista más externa y luego agregar un onTapGesture a una de las vistas dentro de ella para que pueda imprimir el marco globalmente, localmente y usando el espacio de coordenadas personalizado.

        OuterView()
            .background(.red)
            .coordinateSpace(name: "Custom")
    }
}

#Preview {
    Tutorial2_2()
}


struct OuterView: View {
    var body: some View {
        VStack {
            Text("Top")
            InnerView()
                .background(.green)
            Text("Bottom")
        }
    }
}

struct InnerView: View {
    var body: some View {
        HStack {
            Text("Left")
            GeometryReader { proxy in
                Text("Center")
                    .background(.blue)
                    .onTapGesture {
                        print("Global center: \(proxy.frame(in: .global).midX) x \(proxy.frame(in: .global).midY)")
                        print("Custom center: \(proxy.frame(in: .named("Custom")).midX) x \(proxy.frame(in: .named("Custom")).midY)")
                        print("Local center: \(proxy.frame(in: .local).midX) x \(proxy.frame(in: .local).midY)")
                    }
            }
            .background(.orange)
            Text("Right")
        }
    }
}
