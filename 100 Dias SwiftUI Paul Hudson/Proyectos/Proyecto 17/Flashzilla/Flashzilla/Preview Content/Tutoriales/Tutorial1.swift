//
//  Tutorial1.swift
//  Flashzilla
//
//  Created by Esteban Pérez Castillejo on 22/9/24.
//
//  *** Cómo usar los gestos en SwiftUI ***

import SwiftUI


/// SwiftUI gives us lots of gestures for working with views, and does a great job of taking away most of the hard work so we can focus on the parts that matter. We already used onTapGesture() in an earlier project, but there are several others, and there are also interesting ways of combining gestures together that are worth trying out.

struct Tutorial1: View {
    
    /// Voy a saltarme el simple `onTapGesture()` porque lo hemos cubierto anteriormente, pero antes de probar cosas más grandes quiero agregar que puedes pasar un parámetro de `count` a estos para que manejen toques dobles, toques triples y más, así:
    var body: some View {
        Text("Toque Dobles")
            .onTapGesture(count: 2) {
                print("Double tapped!")
            }.padding()
        
        
        /// Vale, echemos un vistazo a algo más interesante que simples toques. Para manejar presiones largas, puede usar `onLongPressGesture()`, así:
        Text("Pulsacion prologanda despues de 2 segundos")
            .onLongPressGesture {
                print("Long pressed!")
            }.padding()
        
        /// Incluso puedes añadir un segundo cierre que se active cada vez que el estado del gesto haya cambiado. A esto se le dará un único parámetro booleano como entrada, y funcionará así:
        
        /// 1. - Tan pronto como presione hacia abajo, el cierre de cambio se llamará con su parámetro establecido en verdadero.
        
        /// 2. - Si libera antes de que se haya reconocido el gesto (por ejemplo, si libera después de 1 segundo cuando usa un reconocedor de 2 segundos), el cierre del cambio se llamará con su parámetro establecido en falso.
        
        /// 3. - Si mantiene presión durante toda la longitud del reconocedor, entonces se llamará al cierre de cambio con su parámetro establecido en falso (porque el gesto ya no está en vuelo), y también se llamará a su cierre de finalización.
        
        /// Usa un código como este para probarlo por ti mismo:
        
        Text("egundo cierre que se active cada vez que el estado del gesto haya cambiado")
            .onLongPressGesture(minimumDuration: 1) {
                print("Long pressed!")
            } onPressingChanged: { inProgress in
                print("In progress: \(inProgress)!")
            }
    }
}

/// Para gestos más avanzados, debe usar el modificador gesture() con una de las estructuras de gestos: DragGesture, LongPressGesture, MagnifyGesture, RotateGesture y TapGesture. Todos estos tienen modificadores especiales, generalmente onEnded() y a menudo onChanged() también, y puedes usarlos para tomar medidas cuando los gestos están en vuelo (para onChanged()) o completados (para onEnded()).

/// Como ejemplo, podríamos adjuntar un gesto de aumento a una vista para que pellizcar dentro y fuera escale la vista hacia arriba y hacia abajo. Esto se puede hacer creando dos propiedades @State para almacenar la cantidad de escala, usándola dentro de un modificador scaleEffect(), y luego estableciendo esos valores en el gesto, así:

struct Ejemplo: View {
    @State private var currentAmount = 0.0
    @State private var finalAmount = 1.0
    var body: some View {
        Text("Hello, World!")
            .scaleEffect(finalAmount + currentAmount)
            .gesture(
                MagnifyGesture()
                    .onChanged { value in
                        currentAmount = value.magnification - 1
                    }
                    .onEnded { value in
                        finalAmount += currentAmount
                        currentAmount = 0
                    }
            )
    }
}


/// Exactamente el mismo enfoque se puede tomar para rotar vistas usando RotateGesture, excepto que ahora estamos usando el modificador rotationEffect():

struct Ejemplo2: View {
    @State private var currentAmount = Angle.zero
    @State private var finalAmount = Angle.zero
    
    var body: some View {
        Text("Hello, World!")
            .rotationEffect(currentAmount + finalAmount)
            .gesture(
                RotateGesture()
                    .onChanged { value in
                        currentAmount = value.rotation
                    }
                    .onEnded { value in
                        finalAmount += currentAmount
                        currentAmount = .zero
                    }
            )
    }
}

/// Donde las cosas comienzan a ser más interesantes es cuando los gestos chocan, cuando tienes dos o más gestos que podrían reconocerse al mismo tiempo, como si tienes un gesto adjunto a una vista y el mismo gesto adjunto a su padre.

// Por ejemplo, esto adjunta un onTapGesture() a una vista de texto y a su padre:
struct Ejemplo3: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .onTapGesture {
                    print("Text tapped")
                }
        }
        .onTapGesture {
            print("VStack tapped")
        }
        
        
        
        /// En esta situación, SwiftUI siempre dará prioridad al gesto del niño, lo que significa que cuando toque la vista de texto de arriba, verá "Texto tocado". Sin embargo, si quieres cambiar eso, puedes usar el modificador highPriorityGesture() para forzar que el gesto del padre se active en su lugar, así:
        
        VStack {
            Text("Hello, World!")
                .onTapGesture {
                    print("Text tapped")
                }
        }
        .highPriorityGesture(
            TapGesture()
                .onEnded {
                    print("VStack tapped")
                }
        )
        
        /// Alternativamente, puede usar el modificador simultaneousGesture() para decirle a SwiftUI que desea que los gestos padre e hijo se activen al mismo tiempo, así:
        
        VStack {
            Text("Hello, World!")
                .onTapGesture {
                    print("Text tapped")
                }
        }
        .simultaneousGesture(
            TapGesture()
                .onEnded {
                    print("VStack tapped")
                }
        )
    }
}

/// Eso imprimirá tanto "Texto tocado" como "VStack tocado".

/// Finalmente, SwiftUI nos permite crear secuencias de gestos, donde un gesto solo se activará si otro gesto ha tenido éxito primero. Esto requiere un poco más de pensamiento porque los gestos deben poder hacer referencia entre sí, por lo que no puede simplemente adjuntarlos directamente a una vista.

/// Aquí hay un ejemplo que muestra la secuenciación de gestos, donde puedes arrastrar un círculo alrededor, pero solo si lo presionas durante mucho tiempo primero:

struct Ejemplo4: View {
    // ¿Qué tan lejos se ha arrastrado el círculo?
    @State private var offset = CGSize.zero

    // Si actualmente se está arrastrando o no
    @State private var isDragging = false

    var body: some View {
        // Un gesto de arrastre que actualiza el desplazamiento y está arrastrando a medida que se mueve
        let dragGesture = DragGesture()
            .onChanged { value in offset = value.translation }
            .onEnded { _ in
                withAnimation {
                    offset = .zero
                    isDragging = false
                }
            }

        // Un gesto de pulsación larga que permite el arrastre
        let pressGesture = LongPressGesture()
            .onEnded { value in
                withAnimation {
                    isDragging = true
                }
            }

        // Un gesto combinado que obliga al usuario a presionar prolongadamente y luego arrastrar
        let combined = pressGesture.sequenced(before: dragGesture)

        // Un círculo de 64x64 que aumenta de escala cuando se arrastra, establece su desplazamiento a lo que tuvimos de vuelta del gesto de arrastre y utiliza nuestro gesto combinado
        Circle()
            .fill(.red)
            .frame(width: 64, height: 64)
            .scaleEffect(isDragging ? 1.5 : 1)
            .offset(offset)
            .gesture(combined)
    }
    
    /// Los gestos son una gran manera de crear interfaces de usuario fluidas e interesantes, pero asegúrese de mostrar a los usuarios cómo funcionan, ¡de lo contrario pueden ser confusos!
}



#Preview {
    Tutorial1()
}
