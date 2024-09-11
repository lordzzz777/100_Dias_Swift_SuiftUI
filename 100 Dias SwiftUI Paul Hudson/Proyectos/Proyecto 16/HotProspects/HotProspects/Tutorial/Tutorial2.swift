//
//  Tutorial2.swift
//  HotProspects
//
//  Created by Esteban Perez Castillejo on 11/9/24.
//

import SwiftUI

struct Tutorial2: View {
    
    @State private var selectedTab = "One"
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Button("Show Tab 2") {
                selectedTab = "Two"
            }
            .tabItem {
                Label("One", systemImage: "star")
            }
            .tag("One")
            
            Text("Tab 2")
                .tabItem {
                    Label("Two", systemImage: "circle")
                }
                .tag("Two")
        }
    }
}

#Preview {
    Tutorial2()
}
