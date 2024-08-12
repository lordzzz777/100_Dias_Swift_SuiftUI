//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Esteban Perez Castillejo on 12/8/24.
//

import SwiftData
import SwiftUI

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ExpenseItem.self)
    }
}
