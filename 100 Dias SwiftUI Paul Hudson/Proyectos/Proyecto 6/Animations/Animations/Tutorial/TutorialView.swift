//
//  TutorialView.swift
//  Animations
//
//  Created by Esteban Perez Castillejo on 4/6/24.
//

import SwiftUI

struct TutorialView: View {
    @State private var animationAmount = 1.0
    @State private var animationAmount2 = 1.0
    @State private var animationAmount3 = 1.0
    @State private var animationAmount4 = 1.0
    @State private var animationAmount5 = 1.0
    @State private var animationAmount6 = 1.0
    @State private var animationAmount7 = 1.0
    @State private var animationAmount8 = 1.0
    
    var body: some View {
        VStack{
            HStack{
            // Ejemplo de boton
            Button("Pulsame"){
                animationAmount += 1
            }.padding(40)
                .background(.red)
                .foregroundStyle(.white)
                .clipShape(Circle())
                .scaleEffect(animationAmount) // Este modificador cambia la escala de tamaño
                .blur(radius: (animationAmount - 1) * 3) // permite añadir un desenfoque gaussiano con un radio especial
                .animation(.default, value: animationAmount) // escalado de animación
            
            /// Podemos controlar el tipo de animación utilizada pasando diferentes valores al modificador. Por ejemplo, podríamos usar .linear para hacer que la animación se mueva a una velocidad constante de principio a fin: `.animation(.linear, value: animationAmount)`
            Button("Pulsame2"){
                animationAmount2 += 1
                
            }.padding(40)
                .background(.blue)
                .foregroundStyle(.white)
                .clipShape(Circle())
                .scaleEffect(animationAmount2)
                .animation(.linear, value: animationAmount2)
        }
            HStack{
                ///  Por ejemplo, esto hace que nuestro botón se amplíe rápidamente y luego rebote mucho: `.animation(.spring(duration: 1, bounce: 0.9), value: animationAmount)`
                
                Button("Pulsame3"){
                    animationAmount3 += 1
                    
                }.padding(40)
                    .background(.black)
                    .foregroundStyle(.white)
                    .clipShape(Circle())
                    .scaleEffect(animationAmount3)
                    .animation(.spring(duration: 1, bounce: 0.9), value: animationAmount3)
                
                /// Para un control más preciso, podemos personalizar la animación con una duración especificada como un número de segundos. Por lo tanto, podríamos obtener una animación fácil de entrar y salir que dura dos segundos como esta:
                
                Button("Pulsame4"){
                    animationAmount4 += 1
                    
                }.padding(40)
                    .background(.gray)
                    .foregroundStyle(.white)
                    .clipShape(Circle())
                    .scaleEffect(animationAmount4)
                    .animation(.easeInOut(duration: 2), value: animationAmount4)
            }
            HStack{
                /// Cuando decimos .easeInOut(duración: 2) en realidad estamos creando una instancia de una estructura de animación que tiene su propio conjunto de modificadores. Por lo tanto, podemos adjuntar modificadores directamente a la animación para añadir un retraso como este:
                
                Button("Pulsame5"){
                    animationAmount5 += 1
                    
                }.padding(40)
                    .background(.green)
                    .foregroundStyle(.white)
                    .clipShape(Circle())
                    .scaleEffect(animationAmount5)
                    .animation(.easeInOut(duration: 2).delay(1), value: animationAmount5)
                
                /// Con eso en su lugar, tocar el botón ahora esperará un segundo antes de ejecutar una animación de dos segundos.
                
                /// También podemos pedirle a la animación que se repita un cierto número de veces, e incluso hacer que rebote hacia atrás y hacia adelante estableciendo las inversas automáticas en true. Esto crea una animación de un segundo que rebotará hacia arriba y hacia abajo antes de alcanzar su tamaño final:
                
                Button("Pulsame6"){
                    animationAmount6 += 1
                    
                }.padding(40)
                    .background(.orange)
                    .foregroundStyle(.white)
                    .clipShape(Circle())
                    .scaleEffect(animationAmount6)
                    .animation(
                        .easeInOut(duration: 1)
                            .repeatCount(3, autoreverses: true),
                        value: animationAmount6
                    )
            }
            HStack{
               /// Si hubiéramos establecido el recuento de repeticiones en 2, entonces el botón se escalaría hacia arriba y luego hacia abajo de nuevo, y luego volvería a subir inmediatamente a su escala más grande. Esto se debe a que, en última instancia, el botón debe coincidir con el estado de nuestro programa, independientemente de las animaciones que apliquemos: cuando la animación termine, el botón debe tener el valor que se establezca en la cantidad de animación.
                
               /// Para las animaciones continuas, hay un modificador repeatForever() que se puede usar de esta manera:
                Button("Pulsame7"){
                    animationAmount7 += 1
                    
                }.padding(40)
                    .background(.yellow)
                    .foregroundStyle(.white)
                    .clipShape(Circle())
                    .scaleEffect(animationAmount7)
                    .animation(
                        .easeInOut(duration: 1)
                            .repeatForever(autoreverses: true),
                        value: animationAmount7
                    )
                
                /// Para demostrar esto, vamos a eliminar la animación del botón en sí y, en su lugar, aplicar una superposición para hacer una especie de círculo pulsante alrededor del botón. Las superposiciones se crean utilizando un modificador de superposición (), que nos permite crear nuevas vistas en el mismo tamaño y posición que la vista que estamos superponiendo.
                
                /// Por lo tanto, primero agregue este modificador de superposición() al botón antes del modificador de animación():
                Button("Pulsame8"){
                  //  animationAmount8 += 1
                    
                }.padding(40)
                    .background(.purple)
                    .foregroundStyle(.white)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(.red)
                            .scaleEffect(animationAmount8)
                            .opacity(2 - animationAmount8)
                            .animation(
                                        .easeOut(duration: 1)
                                            .repeatForever(autoreverses: false),
                                        value: animationAmount8
                                    )
                    )
                    .onAppear {
                        animationAmount8 = 2
                    }
            }
            
        }
        
    }
}

#Preview {
    TutorialView()
}
