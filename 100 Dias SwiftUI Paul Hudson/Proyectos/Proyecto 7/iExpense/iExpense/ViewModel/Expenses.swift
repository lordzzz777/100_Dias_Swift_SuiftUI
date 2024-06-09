//
//  Expenses.swift
//  iExpense
//
//  Created by Esteban Perez Castillejo on 9/6/24.
//

import Foundation
import Observation

@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet{
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
}
