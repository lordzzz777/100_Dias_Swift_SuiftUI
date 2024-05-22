//
//  Tutorial2.swift
//  GuessTheFlag
//
//  Created by Esteban Perez Castillejo on 22/5/24.
//

import SwiftUI

struct ZStackView: View {
    var body: some View {
        //colorea  todo el interior del "ZStack"
        ZStack {
            Text("Mi contenedor")
        }.background(.red)
        
/// Eso podría haber hecho lo que esperabas, pero hay una buena probabilidad de que fuera una sorpresa: solo la vista de texto tenía un color de fondo, a pesar de que le hemos pedido a todo ZStack que lo tenga.
        
/// De hecho, no hay diferencia entre ese código y esto:
        ZStack {
            Text("Mi contenedor2")
                .background(.red)
        }
///  Si quieres rellenar en rojo toda el área detrás del texto, debes colocar el color en el ZStack - trátalo como una vista completa, todo por sí sola:
        
        ZStack {
            /// swiftUI lo entiende como una vista y por defecto rellena todo el espacio deisponible
            Color.red // Esto rellena todo el contenedor
                .frame(width: 100)// altura
                .frame(height: 100)// ancho
               /// la forma optima de modificar el alto y el ancho sería esta " .frame(width: 100, height: 100)"
            
            Text("Mi contenedor3")
            
        }
        
        ZStack{
            Color.red
                .frame(minWidth: 100, maxWidth: .infinity, maxHeight: 100)
            Text("Mi contenedor4")
        }
        
        ZStack{
            Color(red: 1, green: 0.6, blue: 0)// Esto crea colores personalizados
                .frame(minWidth: 100, maxWidth: .infinity, maxHeight: 100)
            Text("Mi contenedor5")
        }
        /// para ignarar las areas seguras y el fondo coja automaticamente de vorde a vorde
        ///  se usaria este modificador ".ignoresSafeArea()"
        
       
/// Antes de que terminemos, hay una cosa más que quiero mencionar: además de usar colores fijos como .red y .green, el modificador background() también puede aceptar materiales. Estos aplican un efecto de vidrio esmerilado sobre lo que venga debajo de ellos, lo que nos permite crear algunos hermosos efectos de profundidad.
        
/// Para ver esto en acción, podríamos construir nuestro ZStack para que tenga dos colores dentro de un VStack, para que dividan el espacio disponible entre ellos. Luego, adjuntaremos un par de modificadores a nuestra vista de texto para que tenga un color gris, con un material ultrafino detrás:
        
        ZStack {
            VStack(spacing: 0) {
                Color.red
                Color.blue
            }

            Text("Mi contenedor6")
                .foregroundStyle(.secondary)
                .padding(50)
                .background(.ultraThinMaterial)
        }
        .ignoresSafeArea()
    
    }
}

#Preview {
    ZStackView()
}
