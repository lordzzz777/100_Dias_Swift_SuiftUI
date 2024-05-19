//
//  ContentView.swift
//  WeSplit
//
//  Created by Lordzzz on 18/5/24.
//

import SwiftUI

struct ContentView: View {
    @FocusState private var amountIsForcused: Bool
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    /// Propiedad calculada
    var totalPerPerson: Double {
        /// Calcula el total por persona aquí
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    /// Caja de texto que introduce un valor formateado a moneda
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "€"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsForcused)
                    
                    /// Picker que muestra un menú, que enumera cuantas personas
                    Picker("Number of people", selection: $numberOfPeople){
                        ForEach(2..<100){
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section("How much tip do you want to leave?"){
                    /// Picker que muestra un porcentaje
                    Picker("Tip percentage", selection: $tipPercentage){
                        ForEach(tipPercentages, id: \.self){
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "€"))
                }
            }
            .navigationTitle("WeSplit")
            .toolbar{
                if amountIsForcused {
                    Button("Done"){
                        amountIsForcused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
