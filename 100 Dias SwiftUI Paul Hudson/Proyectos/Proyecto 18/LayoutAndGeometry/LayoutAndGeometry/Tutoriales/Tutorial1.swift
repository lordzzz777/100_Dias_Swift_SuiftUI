//
//  Tutorial1.swift
//  LayoutAndGeometry
//
//  Created by Esteban Pérez Castillejo on 3/10/24.
//
//  Cómo funciona el diseño en SwiftUI

import SwiftUI

struct Tutorial1: View {
    var body: some View {
        
        // Priemr ejemplo
            Text("Hello, World!")
                .background(.red)
  
        // segundo ejemplo
        Text("Hello, World!")
            .padding(20)
            .background(.red)
        
        // Tercer ejemplo
        Text("Hello, World!")
            .padding()
            .background(.red)
        
        // cuarto ejemplo
        Text("Hello, World!")
            .background(.red)
            .padding()
        
        Color.red
    }
}

#Preview {
    Tutorial1()
}
