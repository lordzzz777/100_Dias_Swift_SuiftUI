//
//  ExampleView.swift
//  WeSplit
//
//  Created by Lordzzz on 18/5/24.
//

import SwiftUI

struct ExampleView: View {
    
    
    let studensList = ["Paco", "Manolo", "Perico", "Jaime", "Antonio"]
    @State private var selectedStuden = "Paco"
    @State private var tapCount = 0
    @State private var name = ""
    var body: some View {
        NavigationStack{
            Form {
                // sección de caja de texto
                Section{
                    TextField("Escribe tu nombre", text: $name)
                    Text("\(name)")
                }
                
                // sección de boton
                Section{
                    Button("Tap Count: \(tapCount)"){
                        tapCount += 1
                    }
                }
                
                // seccion de bucle
                Section{
                    
                    ForEach(0..<5){ number in
                        Text("Row \(number)")
                    }
                }
                
                Section {
                    // sintaxis abreviada
                    Picker("Seleccione estudiante", selection: $selectedStuden){
                        ForEach(studensList, id: \.self){
                            Text($0)
                        }
                    }
                    ForEach(0..<5){
                        Text("Row \($0)")
                    }
                }
                
            }
            .navigationTitle("SwiftUI") // Fuente grande por defecto
            
            // este modificador reduce la fuente del titulo de navegación
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
}

#Preview {
    ExampleView()
}
