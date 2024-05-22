//
//  Tutorial.swift
//  GuessTheFlag
//
//  Created by Esteban Perez Castillejo on 22/5/24.
//

import SwiftUI

struct Tutorial: View {
    var body: some View {
        // coloca los elementos en vertical
        VStack(spacing: 30) {// lo que esta dentro delos parantesis indica el espacios entre elementos
            Text("Hello, world!")
            Text("Hello, world!2")
        }.padding()
        
        VStack(alignment: .leading) { // el "alignment" dica la alineacion
            Text("Hello, world!3")
            Text("Hello, world!4")
        }.padding()
        
        // Colo ca los elementos horizontalmente
        HStack(spacing: 30) {
            Text("Hello, world!")
            Text("Hello, world!2")
        }.padding()
/// Las pilas verticales y horizontales se ajustan automáticamente a su contenido y prefieren alinearse con el centro del espacio disponible. Si quieres cambiar eso, puedes usar una o más vistas espaciadoras para empujar el contenido de tu pila hacia un lado. Estos acumulan automáticamente todo el espacio restante, por lo que si agregas uno al final de un VStack, empujará todas tus vistas a la parte superior de la pantalla:
        
        VStack {
            Text("Hello, world!5")
            Text("Hello, world!6")
            Text("Hello, world!7")
            Spacer()
        }.padding()
        
        VStack{
            Spacer()
            Text("Hello, world!8")
            Text("Hello, world!9")
            Text("Hello, world!10")
            Spacer()
        }
/// También tenemos ZStack para organizar las cosas por profundidad: hace que las vistas se superpongan.
        
        ZStack{
           
            Circle() // esto dibuja un circulo
                .foregroundStyle(.yellow)// lo colorea de amarillo
        
            Rectangle()// Esto dibuja una figura de cuatro lados
                .frame(width: 100, height: 100)// esto modifica el ancho y alto
                .foregroundStyle(.cyan)
            
            Text("Hello, world!11")
                .font(.system(size: 40)) //modifica las propiedades de fuente
                .bold()// coloca la letra en negrita
            
        }
    }
}

#Preview {
    Tutorial()
}
