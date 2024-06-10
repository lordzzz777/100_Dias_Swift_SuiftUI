//
//  ExpenseRow.swift
//  iExpense
//
//  Created by Esteban Perez Castillejo on 10/6/24.
//

import SwiftUI

struct ExpenseRow: View {
    let item: ExpenseItem
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text(item.type)
            }
            
            Spacer()
            Text(item.amount, format: .currency(code: "EUR"))
                .foregroundColor(amountColor(for: item.amount))
                .font(amountFont(for: item.amount))
        }
    }
    
    // Cabia el color segun cantidades
    func amountColor(for amount: Double) -> Color{
        if amount < 50 {
            return .green
        }else if amount < 200 {
            return .orange
        }else {
            return .red
        }
    }
    
    // cambie la fuenta sergun las catidades
    func amountFont(for amount: Double) -> Font{
        if amount < 50 {
            return .body
        }else if amount < 200 {
            return .headline
        }else {
            return .headline.weight(.bold)
        }
    }
}
