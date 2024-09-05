//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Esteban Perez Castillejo on 31/7/24.
//

import SwiftUI

struct ContentView: View {
    @State private var order = Order()
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.type) {
                        ForEach(Order.types.indices, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes: \(order.quantity)", value: $order.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Any special requests?", isOn: $order.specialRequestEnabled)
                    
                    if order.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $order.extraFrosting)
                        
                        Toggle("Add extra sprinkles", isOn: $order.addSprinkles)
                    }
                }
                
                
                Section {
                    NavigationLink("Delivery details") {
                        AddressView(order: order)
                    }
                }
                
//                Section {
//                    List{
//                        ForEach(order.getSavedAddress().sorted(by: <), id: \.key) { key, value in
//                            Text("\(key): \(value)")
//                        }
//                    }
//                    Button("Limpiar datos"){
//                        order.clearSavedAddress()
//                    }
//                }
            }
            .navigationTitle("Cupcake Corner")
            
        }
        .refreshable {
          

        }
    }
}

#Preview {
    ContentView()
}
