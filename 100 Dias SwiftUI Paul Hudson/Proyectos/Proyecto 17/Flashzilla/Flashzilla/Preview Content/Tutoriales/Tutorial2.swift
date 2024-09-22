//
//  Tutorial2.swift
//  Flashzilla
//
//  Created by Esteban Pérez Castillejo on 22/9/24.
//
//  *** Desactivación de la interactividad del usuario con `allowsHitTesting()` ***


import SwiftUI

struct Tutorial2: View {
    /// SwiftUI tiene un algoritmo avanzado de prueba de aciertos que utiliza tanto el marco de una vista como, a menudo, también su contenido. Por ejemplo, si agrega un gesto de toque a una vista de texto, entonces todas las partes de la vista de texto se pueden tocar; no puede tocar a través del texto si presiona exactamente donde está un espacio. Por otro lado, si adjuntas el mismo gesto a un círculo, SwiftUI ignorará las partes transparentes del círculo.
    
    /// Para demostrar esto, aquí hay un círculo que se superpone a un rectángulo usando un ZStack, ambos con modificadores onTapGesture():
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 300, height: 300)
                .onTapGesture {
                    print("Rectangle tapped!")
                }
            
            Circle()
                .fill(.red)
                .frame(width: 300, height: 300)
                .onTapGesture {
                    print("Circle tapped!")
                }
        }
    }
    
    /// Si lo pruebas, encontrará que al tocar dentro del círculo imprime "Círculo tocado", pero en el rectángulo detrás del círculo imprime "Rectángulo tocado", a pesar de que el círculo en realidad tiene el mismo marco que el rectángulo.
    
    /// SwiftUI nos permite controlar la interactividad del usuario de dos maneras útiles, la primera de las cuales es el modificador allowsHitTesting(). Cuando esto se adjunta a una vista con su parámetro establecido en falso, la vista ni siquiera se considera que se puede tocar. Sin embargo, eso no significa que sea inerte, solo que no atrapa ningún toque, las cosas detrás de la vista se tocarán en su lugar.
    
    /// Intenta añadirlo a nuestro círculo de esta manera:
    var Ejemplo2: some View{
        ZStack{
            Rectangle()
                .fill(.blue)
                .frame(width: 300, height: 300)
                .onTapGesture {
                    print("Rectangle tapped!")
                }
            
            Circle()
                .fill(.red)
                .frame(width: 300, height: 300)
                .onTapGesture {
                    print("Circle tapped!")
                }
                .allowsHitTesting(false)
            
        }
    }
    
    /// Ahora, al tocar el círculo, siempre se imprimirá "¡Rectángulo tocado!", porque el círculo se negará a responder a los toques.
    
    /// La otra forma útil de controlar la interactividad del usuario es con el modificador contentShape(), que nos permite especificar la forma que se puede tocar para algo. Por defecto, la forma que se puede tocar para un círculo es un círculo del mismo tamaño, pero puede especificar una forma diferente en su lugar de esta manera:
    var Ejemplo3: some View{
        ZStack{
            Rectangle()
                .fill(.blue)
                .frame(width: 300, height: 300)
                .onTapGesture {
                    print("Rectangle tapped!")
                }
            Circle()
                .fill(.red)
                .frame(width: 300, height: 300)
                .contentShape(.rect)
                .onTapGesture {
                    print("Circle tapped!")
                }
        }
    }
    
    /// Donde el modificador contentShape() realmente se vuelve útil es cuando toca acciones adjuntas a pilas con espaciadores, porque por defecto SwiftUI no activará acciones cuando se toque un espaciador de pila.
    
    
    /// Aquí hay un ejemplo que puedes probar:
    var Ejemplo4: some View{
        VStack{
            VStack {
                Text("Hello")
                Spacer().frame(height: 100)
                Text("World")
            }
            .onTapGesture {
                print("VStack tapped!")
            }
            
            /// Si ejecutas eso, encontrarás que puedes tocar la etiqueta "Hola" y la etiqueta "Mundo", pero no el espacio intermedio. Sin embargo, si usamos contentShape(.rect) en el VStack, entonces toda el área para la pila se puede tocar, incluido el espaciador:
            VStack {
                Text("Hello")
                Spacer().frame(height: 100)
                Text("World")
            }
            .contentShape(.rect)
            .onTapGesture {
                print("VStack tapped!")
            }
        }
    }
    
    
}

#Preview {
    Tutorial2()
}
