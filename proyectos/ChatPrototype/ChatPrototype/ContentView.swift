//
//  ContentView.swift
//  ChatPrototype
//
//  Created by Esteban Perez Castillejo on 11/4/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Knock, knock!")
                .background(Color.yellow, in: RoundedRectangle(cornerRadius: 8))
                .padding()
            
            Text("Who's there?")
                .padding()
                .background(Color.teal, in: RoundedRectangle(cornerRadius: 8))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
