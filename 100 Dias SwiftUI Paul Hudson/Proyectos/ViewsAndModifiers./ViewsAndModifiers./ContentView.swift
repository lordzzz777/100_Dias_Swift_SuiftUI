//
//  ContentView.swift
//  ViewsAndModifiers.
//
//  Created by Esteban Perez Castillejo on 26/5/24.
//

import SwiftUI

struct ContentView: View {
    @State private var useRedText = false
    
    var body: some View {
        
            // Ejemplo de comportamiento de view, cono modificador padding
            Text("Hello, world!")
                .padding()
                .background(.red)
                .padding()
                .background(.blue)
                .padding()
                .background(.green)
                .padding()
                .background(.yellow)
            
        // Boton con operador ternario
            Button("Hola mundo"){
                print(type(of: self.body))
            }.foregroundStyle(useRedText ? .red : .blue)
            .frame(width: 200, height: 200)
        
     // A veces, el uso de declaraciones if es inevitable, pero siempre que sea posible, prefiere usar el operador ternario en su lugar.
        if useRedText {
              Button("Hello World") {
                  useRedText.toggle()
              }
              .foregroundStyle(.red)
          } else {
              Button("Hello World") {
                  useRedText.toggle()
              }
              .foregroundStyle(.blue)
          }
    }
}

#Preview {
    ContentView()
}
