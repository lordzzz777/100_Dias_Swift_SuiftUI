//
//  ContentView.swift
//  WeSplit
//
//  Created by Lordzzz on 18/5/24.
//

/*
 Ejercico:
 ---------
 
1.  Añade un encabezado a la tercera sección, diciendo "Cantidad por persona"

2.  Agregue otra sección que muestre la cantidad total del cheque, es decir, la cantidad original más el valor de la propina, sin dividirla por el número de personas.

3.  Cambie el selector de porcentaje de propinas para mostrar una nueva pantalla en lugar de usar un control segmentado, y dale una gama más amplia de opciones, todo desde el 0 % hasta el 100 %. Consejo: use el rango 0..<101 para su rango en lugar de una matriz fija.
*/

import SwiftUI

struct ContentView: View {
    @FocusState private var amountIsForcused: Bool
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 0
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
    
    var totalCheck: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        return grandTotal
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
                        ForEach(0..<101){
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink)/// ( jercicio 3 check)
                }
                
                Section("How much tip do you want to leave?"){
                    /// Picker que muestra un porcentaje
                    Picker("Tip percentage", selection: $tipPercentage){
                        ForEach(tipPercentages, id: \.self){
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)// cambia el estilo del Picker
                }
                
                ///l Cantidad por persona, ( jercicio 1 check)
                Section("Amount per person") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "€"))
                }
                
                /// La cantidad total del cheque, ( jercicio 2 check)
                Section("The total amount for the check"){
                    Text(totalCheck, format: .currency(code: Locale.current.currency?.identifier ?? "€"))
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
