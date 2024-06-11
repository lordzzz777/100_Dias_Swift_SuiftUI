//
//  Tutorial3.swift
//  Moonshot
//
//  Created by Esteban Perez Castillejo on 11/6/24.
//

import SwiftUI

struct Tutorial3: View {
    var body: some View {
        VStack{
            NavigationStack {
                Text("Tap Me")
                    .navigationTitle("SwiftUI")
            }
            
            NavigationStack {
                NavigationLink("Tap Me") {
                    Text("Detail View")
                }
                .navigationTitle("SwiftUI")
            }
            
            NavigationStack {
                NavigationLink {
                    Text("Detail View")
                } label: {
                    VStack {
                        Text("This is the label")
                        Text("So is this")
                        Image(systemName: "face.smiling")
                    }
                    .font(.largeTitle)
                }
            }
            
            NavigationStack {
                List(0..<100) { row in
                    NavigationLink("Row \(row)") {
                        Text("Detail \(row)")
                    }
                }
                .navigationTitle("SwiftUI")
            }
        }.padding()
    }
}

#Preview {
    Tutorial3()
}
