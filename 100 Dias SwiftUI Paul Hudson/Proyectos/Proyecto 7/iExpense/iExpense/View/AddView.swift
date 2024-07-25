//
//  AddView.swift
//  iExpense
//
//  Created by Esteban Perez Castillejo on 9/6/24.
//

import SwiftUI

struct AddView: View {
    @State private var name = "Add new expense"
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    @Environment (\.dismiss) var dismiss
    
    var expenses: Expenses
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationStack{
            Form{
//                TextField("Name", text: $name)
                
                Picker("Type", selection: $type){
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount",value: $amount, format: .currency(code: "EUR"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle($name)
            .navigationBarTitleDisplayMode(.inline)
          
            .toolbar {
               
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
                Button(role: .cancel, action: {
                    dismiss()
                }, label: {
                    Text("Cancel")
                })
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    AddView(expenses: Expenses())
}
