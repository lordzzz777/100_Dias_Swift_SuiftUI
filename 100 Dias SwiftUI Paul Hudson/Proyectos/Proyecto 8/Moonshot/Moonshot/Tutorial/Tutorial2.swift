//
//  Tutorial2.swift
//  Moonshot
//
//  Created by Esteban Perez Castillejo on 11/6/24.
//

import SwiftUI

struct Tutorial2: View {
    var body: some View {
        
        // Vista de desplazamientos de jemplo:
        
        /*      VStack(spacing: 10){
         ForEach(0..<100){
         Text("Items \($0)")
         .font(.title)
         }
         }
         */
        
        /// Ahora puedes tocar y arrastrar en cualquier lugar de la pantalla,
        /// lo que es mucho más fácil de usar.
        ScrollView{
//            VStack(spacing: 10){
//                ForEach(0..<100){
//                    //                    Text("Items \($0)")
//                    
//                    /// Ahora podemos usar eso dentro de nuestro ForEach:
//                    CustomText("Item \($0)")
//                        .font(.title)
//                }
//            }.frame(maxWidth: .infinity)
            
            LazyVStack(spacing: 10) {
                ForEach(0..<100) {
                    CustomText("Item \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
        
        /// Pila orizontal
        ScrollView(.horizontal) {
            LazyHStack(spacing: 10) {
                ForEach(0..<100) {
                    CustomText("Item \($0)")
                        .font(.title)
                }
            }
        }
        
    }
}

/// Todo esto parece muy sencillo, sin embargo, hay una trampa importante que debes tener en cuenta: cuando añadimos vistas a una vista de desplazamiento, se crean de inmediato. Para demostrar esto, podemos crear una envoltura simple alrededor de una vista de texto normal, como esta:

struct CustomText: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(_ text: String) {
        print("Creating a new CustomText")
        self.text = text
    }
}

#Preview {
    Tutorial2()
}
