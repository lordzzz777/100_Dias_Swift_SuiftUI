//
//  Tutorial5.swift
//  HotProspects
//
//  Created by Esteban Perez Castillejo on 12/9/24.
//

import SwiftUI

struct Tutorial5: View {
    @State private var backgroundColor = Color.red

    var body: some View {
        VStack {
            Text("Hello, World!")
                .padding()
                .background(backgroundColor)

            Text("Change Color")
                .padding()
                .contextMenu {
                    Button("Red",  systemImage: "checkmark.circle.fill", role: .destructive) {
                        backgroundColor = .red
                    }

                    Button("Green") {
                        backgroundColor = .green
                    }

                    Button("Blue") {
                        backgroundColor = .blue
                    }
                }
        }
    }
}

#Preview {
    Tutorial5()
}
