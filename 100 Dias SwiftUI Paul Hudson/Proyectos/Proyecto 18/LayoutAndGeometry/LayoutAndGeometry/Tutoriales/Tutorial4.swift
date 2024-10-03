//
//  Tutorial4.swift
//  LayoutAndGeometry
//
//  Created by Esteban Pérez Castillejo on 3/10/24.
//
//  Posicionamiento absoluto para las vistas de SwiftUI

import SwiftUI

struct Tutorial4: View {
    var body: some View {
        ScrollView{
            ejemplp1
            ejemplo2
            ejemplo3
            ejemplo4
            ejemplo5
        }
    }
    
    var ejemplp1: some View {
        /// SwiftUI nos da dos formas de posicionar las vistas: posiciones absolutas usando position() y posiciones relativas usando offset(). Pueden parecer similares, pero una vez que entiendes cómo SwiftUI coloca las vistas dentro de los marcos, las diferencias subyacentes entre position() y offset() se vuelven más claras.
        
       /// Una vista simple de SwiftUI se ve así:
        Text("Hello, world!")
    }
    
    var ejemplo2: some View {
        /// SwiftUI ofrece todo el espacio disponible a ContentView, que a su vez lo pasa a la vista de texto. La vista de texto utiliza automáticamente solo tanto espacio como su texto necesita, por lo que pasa esa copia de seguridad a ContentView, que es siempre y exactamente del mismo tamaño que su cuerpo (por lo que encaja directamente alrededor del texto). Como resultado, SwiftUI centra ContentView en el espacio disponible, que desde la perspectiva de un usuario es lo que coloca el texto en el centro.
        
        /// Si desea posicionar absolutamente una vista de SwiftUI, debe usar el modificador position() de esta manera
        Text("Hello, world!")
            .position(x: 100, y: 100)
    }
    
    var ejemplo3: some View {
        /// Eso posicionará la vista de texto en x:100 y:100 dentro de su padre. Ahora, para ver realmente lo que está sucediendo aquí, quiero que agregues un color de fondo:
        Text("Hello, world!")
            .background(.red)
            .position(x: 100, y: 100)
    }
    
    var ejemplo4: some View {
        /// Verás que el texto tiene un fondo rojo bien ajustado a su alrededor. Ahora intenta mover el modificador background() debajo del modificador position(), así:
        Text("Hello, world!")
            .position(x: 100, y: 100)
            .background(.red)
    }
    
    var ejemplo5: some View {
        /// Ahora verás que el texto está en la misma ubicación, pero toda el área segura es de color rojo.
        
        /// Para entender lo que está sucediendo aquí, debe recordar el proceso de diseño de tres pasos de SwiftUI:
        
        /// Una vista principal propone un tamaño para su hijo.
        
        /// Basándose en esa información, el niño elige su propio tamaño y el padre debe respetar esa elección.
        
        /// Luego, el padre coloca al hijo en su espacio de coordenadas.
        
        /// Por lo tanto, el padre es responsable de posicionar al niño, no al niño. Esto causa un problema, porque acabamos de decirle a nuestra vista de texto que esté en una posición exacta, ¿cómo puede SwiftUI resolver esto?
        
        /// La respuesta a esto también es por qué nuestro color background() hizo que toda el área segura fuera roja: cuando usamos position(), obtenemos una nueva vista que ocupa todo el espacio disponible, para que pueda colocar a su hijo (el texto) en la ubicación correcta.
        
        /// Cuando usamos texto, posición, luego fondo, la posición ocupará todo el espacio disponible para que pueda colocar su texto correctamente, luego el fondo usará ese tamaño para sí mismo. Cuando usamos texto, fondo, luego posición, el fondo usará el tamaño del texto para su tamaño, luego la posición ocupará todo el espacio disponible y colocará el fondo en la ubicación correcta.
        
        /// Al discutir el modificador offset() anteriormente, dije "si compensas algún texto, sus dimensiones originales en realidad no cambian, a pesar de que la vista resultante se representa en una ubicación diferente". Con eso en mente, intente ejecutar este código:
        Text("Hello, world!")
            .offset(x: 100, y: 100)
            .background(.red)
    }
    
    /// Verás que el texto aparece en un lugar y el fondo en otro. Voy a explicar por qué es eso, pero primero quiero que lo pienses tú mismo porque si lo entiendes, entonces realmente entiendes cómo funciona el sistema de diseño de SwiftUI.
    
    /// Cuando usamos el modificador offset(), estamos cambiando la ubicación donde se debe renderizar una vista sin cambiar realmente su geometría subyacente. Esto significa que cuando aplicamos background() después, utiliza la posición original del texto, no su desplazamiento. Si mueves el orden del modificador para que background() venga antes de offset(), entonces las cosas funcionan más como podrías haber esperado, demostrando una vez más que el orden del modificador importa.
}

#Preview {
    Tutorial4()
}
