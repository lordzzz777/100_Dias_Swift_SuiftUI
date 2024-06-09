//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Esteban Perez Castillejo on 9/6/24.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
