//
//  AddView.swift
//  iExpense
//
//  Created by Esteban Perez Castillejo on 12/8/24.
//

import SwiftData
import SwiftUI

struct AddView: View {
    @State private var name = "Add new expense"
    @State private var type = "Personal"
    @State private var amount = 0.0

    
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationStack{
            Form{
                Picker("Type", selection: $type){
                    ForEach(types, id: \.self){
                        Text($0)
                    }
                }
                
                TextField("Amount",value: $amount, format: .currency(code: "EUR"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle($name)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigation, content: {
                    Button("Save"){
                        let item = ExpenseItem(name: name, type: type, amount: amount)
                        modelContext.insert(item)
                       dismiss()
                    }
                })
                
                ToolbarItem(placement: .automatic, content: {
                    Button(role: .cancel, action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(.red)
                    })
                })
            }
            
        }
    }
}

#Preview {

       return AddView()
                 .modelContainer(for: ExpenseItem.self)

}
