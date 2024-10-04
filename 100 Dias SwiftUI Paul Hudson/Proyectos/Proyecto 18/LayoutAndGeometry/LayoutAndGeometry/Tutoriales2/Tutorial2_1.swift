//
//  Tutorial2_1.swift
//  LayoutAndGeometry
//
//  Created by Esteban Pérez Castillejo on 4/10/24.
//
//  Reescar el tamaño de las imágenes para que se
//  ajusten a la pantalla usando GeometryReader

import SwiftUI

struct Tutorial2_1: View {
    var body: some View {
        VStack{
            Text("Imajen de ejemplo 1").font(.title3.bold())
            Image(.example)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
        }.padding()
        /// Todo esto funciona muy bien si queremos vistas de tamaño fijo, pero muy a menudo quieres imágenes que se escalan automáticamente para llenar más de la pantalla en una o ambas dimensiones. Es decir, en lugar de codificar un ancho de 300, lo que realmente quieres decir es "hacer que esta imagen llene el 80% del ancho de la pantalla".
        
        /// Una opción es usar el modificador `containerRelativeFrame()`, que cubrimos en el proyecto 8. Pero SwiftUI también nos da un tipo dedicado para este trabajo llamado `GeometryReader`, y es notablemente poderoso.
        
        /// En breve entraremos en muchos más detalles sobre `GeometryReader`, pero por ahora lo usaremos para un trabajo: asegurarnos de que nuestra imagen llene algún porcentaje del ancho de su contenedor.
        
        /// `GeometryReader` es una vista igual que las otras que hemos usado, excepto que cuando la creamos se nos entregará un objeto `GeometryProxy` para usar. Esto nos permite consultar el entorno: ¿qué tan grande es el contenedor? ¿Cuál es nuestra posición? ¿Hay alguna inserciones de área segura? Y así.
        
        /// En principio, eso parece bastante simple, pero en la práctica necesitas usar `GeometryReader` con cuidado porque se expande automáticamente para ocupar el espacio disponible en tu diseño, luego posiciona su propio contenido alineado con la esquina superior izquierda.
        
        /// Por ejemplo, podríamos hacer una imagen que tenga el 80% del ancho de la pantalla, con una altura fija de 300:
        
        VStack {
            Text("Imajen de ejemplo 2").font(.title3.bold())
            GeometryReader { proxy in
                Image(.example)
                    .resizable()
                    .scaledToFit()
                // Incluso puedes quitar la altura de la imagen, así:
                    .frame(width: proxy.size.width * 0.8/*, height: 300*/)
            }
        }.padding()
        
        /// Le hemos dado a SwiftUI suficiente información para que pueda calcular automáticamente la altura: conoce el ancho original, conoce nuestro ancho objetivo y conoce nuestro modo de contenido, por lo que entiende cómo la altura objetivo de la imagen será proporcional al ancho objetivo.
        
        /// Ahora, probablemente te estés preguntando en qué se diferencia esto de usar `containerRelativeFrame()`. Bueno, el problema es que containerRelativeFrame() tiene una definición muy precisa de lo que constituye un "contenedor": podría ser toda la pantalla, podría ser un `NavigationStack`, podría ser una Lista o un `ScrollView`, y así sucesivo, pero no considerará un `HStack` o un `VStack` un contenedor.
        
        /// Esto causa problemas cuando se usan vistas en pilas, porque no se pueden subdividir fácilmente usando containerRelativeFrame(). Por ejemplo, el siguiente código coloca dos vistas en un `HStack`, con una con un ancho fijo y la otra usando un marco relativo de contenedor:
        VStack {
            Text("Imajen de ejemplo 3").font(.title3.bold())
            HStack {
                Text("IMPORTANT")
                    .frame(width: 200)
                    .background(.blue)
                
                Image(.example)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { size, axis in
                        size * 0.8
                    }
                /// Eso no va a estar bien en absoluto, porque el `containerRelativeFrame()` leerá todo el ancho de la pantalla por su tamaño, lo que significa que la imagen será del 80% del ancho de la pantalla a pesar de que 200 puntos de la pantalla es una vista de texto.
                
                /// Por otro lado, el uso de un `GeometryReader` subdividirá el espacio correctamente:
            }
        }
        
        VStack{
            Text("Imajen de ejemplo 4").font(.title3.bold())
            GeometryReader { proxy in
                Image(.example)
                    .resizable()
                    .scaledToFit()
                    .frame(width: proxy.size.width * 0.8)
            }
        }
        /// Por supuesto, eso introduce un problema diferente: ¡nuestra imagen ahora está alineada con la esquina superior izquierda del `GeometryReader`!
        
        /// Afortunadamente, esto se resuelve fácilmente. Si alguna vez quieres centrar una vista dentro de un `GeometryReader`, en lugar de alinearse con la esquina superior izquierda, añade un segundo fotograma que lo haga llenar todo el espacio del contenedor, así:
        VStack{
            Text("Imajen de ejemplo 5").font(.title3.bold())
            GeometryReader { proxy in
                Image(.example)
                    .resizable()
                    .scaledToFit()
                    .frame(width: proxy.size.width * 0.8)
                    .frame(width: proxy.size.width, height: proxy.size.height)
            }
        }
        
    }
}

#Preview {
    Tutorial2_1()
}
