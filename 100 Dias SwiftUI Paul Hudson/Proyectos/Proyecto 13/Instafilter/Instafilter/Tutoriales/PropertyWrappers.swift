//
//  PropertyWrappers.swift
//  Instafilter
//
//  Created by Esteban Perez Castillejo on 16/8/24.
//

import SwiftUI

// Envoltura de propiuedades
struct PropertyWrappers: View {
    
    /// la enoltura de epropiedades en realiodad es un structura
    /// pulsar Shift + command + O, en el buscador escribir "state"
    
    @State private var blurAmont = 0.0
    
   /// didSet{ print("New value is \(blurAmont)")} no mostrara nada
   /// intentas cambiar el valor con el Slider, pero si con el botón
    
    var body: some View {
        VStack {
            Text("Hello, World!").font(.system(size: 50).bold())
                .blur(radius: blurAmont)
            Slider(value: $blurAmont, in: 0...20)
                .onChange(of: blurAmont){
                    /// onChange si mostrasra el valor del "blurAmont", al usar el "Slider"
                    print("New value is \(blurAmont)")
                }
            Button("Random Blur"){
                blurAmont = Double.random(in: 0...20)
            }
        }.padding()
    }
}

#Preview {
    PropertyWrappers()
}
