//
//  BirthdaysApp.swift
//  Birthdays
//
//  Created by Esteban Perez Castillejo on 22/4/24.
//

import SwiftUI
import SwiftData

@main
struct BirthdaysApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Friend.self)
        }
    }
}
