//
//  SwiftDataProjectTutoApp.swift
//  SwiftDataProjectTuto
//
//  Created by Esteban Perez Castillejo on 10/8/24.
//

import SwiftUI

@main
struct SwiftDataProjectTutoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: User.self)
    }
}
