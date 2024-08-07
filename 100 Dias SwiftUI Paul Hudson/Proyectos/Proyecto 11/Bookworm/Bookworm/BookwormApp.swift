//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Esteban Perez Castillejo on 7/8/24.
//

import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: Book.self)
    }
}
