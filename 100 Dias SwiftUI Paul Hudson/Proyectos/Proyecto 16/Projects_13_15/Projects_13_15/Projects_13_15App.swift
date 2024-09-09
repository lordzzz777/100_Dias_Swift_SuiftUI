//
//  Projects_13_15App.swift
//  Projects_13_15
//
//  Created by Esteban Perez Castillejo on 9/9/24.
//

import SwiftUI
import SwiftData

@main
struct Projects_13_15App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                
        }.modelContainer(for: ModelData.self)
    }
}
