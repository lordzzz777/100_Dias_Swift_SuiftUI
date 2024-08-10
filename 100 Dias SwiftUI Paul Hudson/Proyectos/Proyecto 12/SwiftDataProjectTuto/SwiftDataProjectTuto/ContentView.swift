//
//  ContentView.swift
//  SwiftDataProjectTuto
//
//  Created by Esteban Perez Castillejo on 10/8/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(filter: #Predicate<User>{user in
/// Ejemplo 1
        user.name.contains("R") && user.city == "London"
        
/// Ejemplo 2
//        if user.name.localizedStandardContains("R") {
//            if user.city == "London" {
//                return true
//            } else {
//                return false
//            }
//        } else {
//            return false
//        }
        
/// Ejemplo 3 (Este codigo de ejeplo no funciona apesar de ser codigo swift Puro)
//        if user.name.localizedStandardContains("R") {
//            if user.city == "London" {
//                return true
//            }
//        }
//
//        return false
    }, sort: \User.name) var users: [User]
    
    var body: some View {
        NavigationStack{
            List(users){ user in
                Text(user.name)
            }
            .navigationTitle("Users")
            .toolbar{
                Button("Add Samples", systemImage: "plus") {
                    try? modelContext.delete(model: User.self)
                    let first = User(name: "Ed Sheeran", city: "London", joinDate: .now.addingTimeInterval(86400 * -10))
                    let second = User(name: "Rosa Diaz", city: "New York", joinDate: .now.addingTimeInterval(86400 * -5))
                    let third = User(name: "Roy Kent", city: "London", joinDate: .now.addingTimeInterval(86400 * 5))
                    let fourth = User(name: "Johnny English", city: "London", joinDate: .now.addingTimeInterval(86400 * 10))

                    modelContext.insert(first)
                    modelContext.insert(second)
                    modelContext.insert(third)
                    modelContext.insert(fourth)
                }
            }
        }
        
    }
}

#Preview {
    ContentView()
}
