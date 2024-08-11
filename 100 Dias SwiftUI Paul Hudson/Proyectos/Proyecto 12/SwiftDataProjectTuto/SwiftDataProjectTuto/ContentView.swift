//
//  ContentView.swift
//  SwiftDataProjectTuto
//
//  Created by Esteban Perez Castillejo on 10/8/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @State private var showingUpcomingOnly = false
    @State private var sortOrder = [
        SortDescriptor(\User.name),
        SortDescriptor(\User.joinDate),
    ]
    
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
            UsersView(minimumJoinDate: showingUpcomingOnly ? .now : .distantPast, sortOrder: sortOrder)
            .navigationTitle("Users")
            .toolbar{
                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    Picker("Sort", selection: $sortOrder) {
                        Text("Sort by Name")
                            .tag([
                                SortDescriptor(\User.name),
                                SortDescriptor(\User.joinDate),
                            ])
                        
                        Text("Sort by Join Date")
                            .tag([
                                SortDescriptor(\User.joinDate),
                                SortDescriptor(\User.name)
                            ])
                    }
                }
                
                Button(showingUpcomingOnly ? "Show Everyone" : "Show Upcoming") {
                    showingUpcomingOnly.toggle()
                }
                
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
        .modelContainer(for: User.self)
}
