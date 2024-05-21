//
//  ContentView.swift
//  MetricCompression
//
//  Created by Lordzzz on 21/5/24.
//

/*
Enunciado del ejercicio:
------------------------

Crea una aplicación que maneje las conversiones de unidades:
 
El usuario ingresara un valor, seleccionarán una unidad de entrada
y una unidad de salida, muestra el resultado en un Text.
 
Conversión de longitud: 
los usuarios eligen metros, kilómetros, pies, yardas o millas.
 */

import SwiftUI

struct ContentView: View {
    /// Variable que guarda el valor que inserta el usuaeio
    @State private var userInput = ""
    
    /// variable que guarda la unidad de entrada
    @State private var inputUnit = ""
    
    /// variable que guarde la unidad de salida
    @State private var outputUniti = ""
    
    /// Matriz que de cadena de texto, que representa las unidades de distancias
    let units = ["Metros", "Kilometros", "Pies", "Yardas", "Millas"]
    
    /// Diccionario,  la clave en cadena de texto, y el valor decimal
    /// representa la unidad de combersión de distacias
    let unitCombersions: [String: Double] = [
        "Metros": 1,
        "Kilometros": 1000,
        "Pies": 0.3048,
        "Yardas": 0.9144,
        "Millas": 1609.34
    ]
    
    /// variable calculada, donde efectuamos la operación
    var convertedValue: Double {
        /// controlamos que el usuaria, lo pueda añadir un valor de tipo decimal
        guard let inputValue = Double(userInput),
              let inputMultiplier = unitCombersions[inputUnit],
              let outMultiplier = unitCombersions[outputUniti] else {
            return 0
        }
        /// Realizamos las operaciones
        let valueIntMeters = inputValue * inputMultiplier
        let convertedValue = valueIntMeters / outMultiplier
        
        /// retornamos el resultado
        return convertedValue
    }
    
    var body: some View {
        NavigationStack{
            Form{
                Section("Unidad de entrada"){
                    
                    TextField("Ingrese valor", text: $userInput)
                        .keyboardType(.decimalPad)/// el telclado del dispositivo sea decimal
                    
                    Picker("Unidad", selection: $inputUnit, content: {
                        ForEach(units, id: \.self){
                            Text("\($0)")
                        }
                    }).pickerStyle(.segmented)
                }
                Section("Unidad de salida"){
                    
                    Picker("Unidad", selection: $outputUniti, content: {
                        ForEach(units, id: \.self){
                            Text("\($0)")
                        }
                    }).pickerStyle(.segmented)
                }
                Section("Resultado"){
                    
                    /// condicionalos la forma en el que se muetra los decimales
                    if convertedValue > 0.0000 {
                        Text("\(String(format: "%.0f", convertedValue)) \(outputUniti)")
                    }else {
                        Text("\(String(format: "%.4f", convertedValue)) \(outputUniti)")
                    }
                }
                
            }
            .navigationTitle("Comversor deDistacias")
            /// foma en la que mostramos el titulo en la barra de navegacíon
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
