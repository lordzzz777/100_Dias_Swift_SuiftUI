//
//  Tutorial3.swift
//  SnowSeeker
//
//  Created by Esteban Pérez Castillejo on 9/10/24.
//
//  Uso de grupos como contenedores de diseño transparentes

import SwiftUI

/// Ese grupo no contiene más información de diseño que aplicar una fuente a las tres vistas de texto, por lo que no sabemos si las tres vistas de texto se apilarán vertical, horizontalmente o por profundidad. Aquí es donde el comportamiento de diseño transparente del Grupo se vuelve importante: cualquiera que sea el lugar del padre, un UserView decide cómo se organizan sus vistas de texto.

/// Por ejemplo, podríamos crear un ContentView como este:
struct Tutorial3: View {
    
    
    /// Eso oscila entre el diseño vertical y horizontal cada vez que se toca el botón.
    
    /// Puede que te preguntes con qué frecuencia necesitas tener diseños alternativos como este, pero la respuesta puede sorprenderte: ¡es muy común! Verás, esto es exactamente lo que quieres que suceda al intentar escribir código que funcione en múltiples tamaños de dispositivo, si queremos que el diseño ocurra verticalmente cuando el espacio horizontal está restringido, pero horizontalmente de lo contrario. Apple proporciona una solución muy simple llamada clases de tamaño, que es una forma completamente vaga de decirnos cuánto espacio tenemos para nuestras vistas.

    /// Cuando digo "completamente vago" lo digo en serio: solo tenemos dos clases de tamaño horizontal y verticalmente, llamadas "compacto" y "regular". Eso es todo, que cubre todos los tamaños de pantalla, desde el iPad Pro más grande en horizontal hasta el iPhone más pequeño en vertical. Eso no significa que sea inútil, ¡ni mucho menos!, solo que solo nos permite razonar sobre nuestras interfaces de usuario en los términos más amplios.

    /// Para demostrar las clases de tamaño en acción, podríamos crear una vista que tenga una propiedad para rastrear la clase de tamaño actual para que podamos cambiar entre VStack y HStack automáticamente:
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    @State private var layoutVertically = false
    
    var body: some View {
        Button {
            layoutVertically.toggle()
        } label: {
            
            /// Consejo: En situaciones como esta, donde solo tienes una vista dentro de una pila y no toma ningún parámetro, puedes pasar el inicializador de la vista directamente a la VStack para hacer tu código más corto:
            if layoutVertically {
                VStack(content: UserView.init)
            } else {
                HStack(content: UserView.init)
            }
        }
        
        if horizontalSizeClass == .compact {
            VStack {
                UserView()
            }
        } else {
            HStack {
                UserView()
            }
        }
        
        
        /// Sé que el código corto no lo es todo, pero esta técnica es agradablemente concisa cuando se utiliza este enfoque para el diseño de la vista agrupada.
        
        /// Lo que ves cuando se ejecuta ese código depende del dispositivo que estés usando. Por ejemplo, un iPhone 15 Pro tendrá una clase de tamaño horizontal compacta tanto en vertical como en horizontal, mientras que un iPhone 15 Pro Max tendrá una clase de tamaño horizontal regular cuando esté en horizontal.

        /// Independientemente de si estamos activando nuestro diseño usando clases de tamaño o botones, el punto es que a UserView simplemente no le importa: su Grupo simplemente agrupa las vistas de texto sin afectar su diseño en absoluto, por lo que la disposición de diseño que se le da a UserView depende completamente de cómo se usa.

        /// Antes de terminar, quiero mencionar que SwiftUI proporciona una visión que de alguna manera facilita este comportamiento. Se llama ViewThatFits, y puede proporcionarle varios diseños diferentes: probará automáticamente cada uno en orden hasta que encuentre uno que pueda encajar en el espacio disponible.

        /// Por ejemplo, esto intentará mostrar un rectángulo de 500x200 por defecto, pero si eso no cabe en el espacio disponible, mostrará un círculo de 200x200 en su lugar:
        ViewThatFits {
            Rectangle()
                .frame(width: 500, height: 200)

            Circle()
                .frame(width: 200, height: 200)
        }
    }
}

#Preview {
    Tutorial3()
}

/// La vista de grupo de SwiftUI puede parecer extraña al principio, porque en realidad no afecta a nuestro diseño en absoluto. Sin embargo, cumple un propósito importante como contenedor de diseño transparente: nos da la capacidad de agregar modificadores de SwiftUI a múltiples vistas sin cambiar su diseño, o devolver múltiples vistas sin usar @ViewBuilder.

/// Por ejemplo, este UserView tiene un grupo que contiene tres vistas de texto:
struct UserView: View {
    var body: some View {
        Group {
            Text("Name: Paul")
            Text("Country: England")
            Text("Pets: Luna and Arya")
        }
        .font(.title)
    }
}
