//
//  Tutorial1.swift
//  Moonshot
//
//  Created by Esteban Perez Castillejo on 11/6/24.
//

import SwiftUI

struct Tutorial1: View {
    @State private var isImagenShow1 = false
    @State private var isImagenShow2 = false
    var body: some View {
        NavigationStack{
// llamas a la imagen con una cadena de texto: -> "Image("lanzadera")"
// pero puede llamarla -> "Image(.lanzadera)"
            VStack{
               
                if isImagenShow1{
                    HStack{
                        /// El marco de la vista de la imagen se ha configurado correctamente, pero el contenido de la imagen todavía se muestra como su tamaño original.
                        Image(.lanzadera)
                            .frame(width: 200, height: 200)
                            .clipped()
                        
                        /// Si también quieres que se cambie el tamaño del contenido de la imagen, tenemos que usar el modificador resizable() como este:
                        Image(.lanzadera)
                            .resizable()
                            .frame(width: 200, height: 200)
                        /// Eso es mejor, pero solo. Sí, la imagen ahora se está redimensionando correctamente, pero probablemente se vea aplastada. Mi imagen no era cuadrada, por lo que se ve distorsionada ahora que se ha redimensionado a una forma cuadrada.
                    }.padding()
                }
                if isImagenShow2{
                    HStack{
                        /// la imagen encajará dentro del contenedor, incluso si eso significa dejar algunas partes de la vista vacías.
                        Image(.lanzadera)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                        
                        /// la vista no tendrá partes vacías, incluso si eso significa que parte de nuestra imagen se encuentra fuera del contenedor.
                        Image(.lanzadera)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 200)
                    }
                }
                /// Imagen que ocupa el 80 % del ancho de la pantalla
                Image(.lanzadera)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { size, axis in
                        size * 0.8
                    }
                /// Vamos a desglosar ese código:
                
                /// Estamos diciendo que queremos darle a esta imagen un marco relativo al tamaño horizontal de su padre. No estamos especificando un tamaño vertical; más sobre eso en un momento.
                
                /// SwiftUI luego ejecuta un cierre en el que se nos da un tamaño y un eje. Para nosotros, el eje será .horizontal porque ese es el que estamos usando, pero esto importa más cuando se crean tamaños relativos horizontales y verticales. El valor del tamaño será el tamaño de nuestro contenedor, que para esta imagen es la pantalla completa.
                
                /// Necesitamos devolver el tamaño que queremos para este eje, por lo que estamos devolviendo el 80 % del ancho del contenedor.
                
                /// Una vez más, no necesitamos especificar una altura aquí. Esto se debe a que le hemos dado a SwiftUI suficiente información para que pueda calcular automáticamente la altura: conoce el ancho original, conoce nuestro ancho objetivo y conoce nuestro modo de contenido, por lo que entiende cómo la altura objetivo de la imagen será proporcional al ancho objetivo.
                /// Para ver mejor este compotamiento integrare una sere de botones que aran desaparecesr el resto de imagenes y veras como la imagen se rescala a medida que estas desaparecen, ocupando siempre el 80% de la pantaalla
            
            }.padding()
                .navigationTitle("Tutorial Imagen")
                .toolbar{
                    HStack{
                        Button(isImagenShow1 ? "Quitar" : "Poner"){
                            withAnimation(.easeInOut){
                                isImagenShow1.toggle()
                            }
                        }.foregroundStyle(.white).padding(8)
                        .background(isImagenShow1 ? .red : .green)
                            .clipShape(.rect(cornerRadius: 8))
                        Button(isImagenShow2 ? "Quitar" : "Poner"){
                            withAnimation(.easeInOut){
                                isImagenShow2.toggle()
                            }
                        }.foregroundStyle(.white).padding(8)
                        .background(isImagenShow2 ? .red : .green)
                            .clipShape(.rect(cornerRadius: 8))
                       
                        
                    }
                }
        }
            
    }
}

#Preview {
    Tutorial1()
}
