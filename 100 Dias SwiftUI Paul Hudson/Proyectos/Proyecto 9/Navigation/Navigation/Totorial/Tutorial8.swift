//
//  Tutorial8.swift
//  Navigation
//
//  Created by Esteban Perez Castillejo on 23/7/24.
//

import SwiftUI

struct Tutorial8: View {
    @State private var title = "swiftUI"
    var body: some View {
        NavigationStack {
            Text("Hello, world!")
                .navigationTitle($title)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    Tutorial8()
}
