//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Esteban Perez Castillejo on 10/8/24.
//

import SwiftData
import SwiftUI

@main
struct SwiftDataProjectApp: App {
    
    var body: some Scene {
        // Tutoriales
        WindowGroup {
            TutoPaul()
        
        }
        .modelContainer(for: User.self)
        
        
        WindowGroup {
            ContentView()
        }
        
    }
}
