//
//  AstronautView.swift
//  Moonshot
//
//  Created by Esteban Perez Castillejo on 20/7/24.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    
    var body: some View {
        ScrollView{
            VStack{
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                    .accessibilityLabel(astronaut.name)
                Text(astronaut.description)
                    .padding()
                    .accessibilityLabel("Descripción del astronauta: \(astronaut.description)")
            }
        }
        .background(.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
        .accessibilityElement(children: .contain)
    }
}

#Preview {
    let astranauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    return AstronautView(astronaut: astranauts["aldrin"]!)
        .preferredColorScheme(.dark)
}
