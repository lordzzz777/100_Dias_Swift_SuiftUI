//
//  DecoderJSONApp.swift
//  DecoderJSON
//
//  Created by Esteban Perez Castillejo on 13/8/24.
//

import SwiftData
import SwiftUI

@main
struct DecoderJSONApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .environment(UserViewModel())
    }
}
