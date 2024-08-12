//
//  ContentView.swift
//  iExpense
//
//  Created by Esteban Perez Castillejo on 12/8/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @State private var showingAddExpense = false

    @Environment(\.modelContext) var modelContext
    @Query(filter: #Predicate<ExpenseItem>{ types in
        types.type.contains("Personal")
    }, sort: \ExpenseItem.name) var personal: [ExpenseItem]
    
    @Query(filter: #Predicate<ExpenseItem>{ types in
        types.type.contains("Business")
    }, sort: \ExpenseItem.name) var business: [ExpenseItem]
    
    
    var body: some View {
        NavigationStack {
            
            List{
                Section(header: Text("Personal Expenses")){
                    ForEach(personal, id: \.id){ item in
                        ExpenseRow(item: item)
                    }
                    .onDelete (perform: { item in
                        for index in item{
                            removeItem(personal[index])
                        }
                    })

                }
                
                Section(header: Text("Personal Expenses")){
                    ForEach(business, id: \.id){ business in
                        ExpenseRow(item: business)
                    }
                    .onDelete (perform: { item in
                        for index in item{
                            removeItem(business[index])
                        }
                    })
                }
            }
            /// Barra de herramientas o navegacion
                .navigationTitle("iExpense")
                .toolbar{
                    Button("Add Expense", systemImage: "plus"){
                        showingAddExpense = true
                    }
                }
                .sheet(isPresented: $showingAddExpense, content: {
                      AddView()
                        .presentationDetents([.medium])
                        
                })
        }
    }

    
    func removeItem(_ item: ExpenseItem){
        modelContext.delete(item)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: ExpenseItem.self)
}
