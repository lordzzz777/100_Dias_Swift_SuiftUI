//
//  ContentView.swift
//  iExpense
//
//  Created by Esteban Pérez Castillejo on 9/6/24.
//

import SwiftUI

struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack{
            NavigationLink("New Expense", destination: {
                AddView(expenses: expenses)
            }).offset(x: -130).padding()
            
            List{
                Section(header: Text("Personal Expenses")){
                    ForEach(expenses.items.filter{$0.type == "Personal"}){ item in
                        ExpenseRow(item: item)
                            .accessibilityElement()
                            .accessibilityLabel("\(item.name), $\(item.amount, specifier: "%.2f")")
                            .accessibilityHint("Personal expense")
                        
                    }
                    .onDelete { offsets in
                        removeItems(at: offsets, type: "Personal")
                    }
                    
                }
                
                Section(header: Text("Business Expenses")){
                    ForEach(expenses.items.filter{$0.type == "Business"}){ item in
                        ExpenseRow(item: item)
                            .accessibilityElement()
                            .accessibilityLabel("\(item.name), $\(item.amount, specifier: "%.2f")")
                            .accessibilityHint("Personal expense")
                    }
                    .onDelete { offsets in
                        removeItems(at: offsets, type: "Business")
                    }
                    
                }
            }
            .navigationTitle("iExpense")
            .toolbar{
                Button("Add Expense", systemImage: "plus"){
                    showingAddExpense = true
                }
            }
            .sheet(isPresented: $showingAddExpense, content: {
                AddView(expenses: expenses)
                    .presentationDetents([.medium])
            })
        }
    }
    
    func removeItems(at offsets: IndexSet){
        expenses.items.remove(atOffsets: offsets)
    }
    
    /// Eliminar elementos de una lista de gastos específica (ya sea personal o comercial) basándose en sus índices
    func removeItems(at offsets: IndexSet, type: String) {
        let itemsToRemove = expenses.items.filter { $0.type == type }
        for index in offsets {
            if let itemIndex = expenses.items.firstIndex(where: { $0.id == itemsToRemove[index].id }) {
                expenses.items.remove(at: itemIndex)
            }
        }
    }
    
    
}

#Preview {
    ContentView()
}
