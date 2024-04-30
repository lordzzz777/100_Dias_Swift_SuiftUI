//
//  DiceView.swift
//  DiceRoller
//
//  Created by Esteban Perez Castillejo on 18/4/24.
//

import SwiftUI

struct DiceView: View {
  @State private var numberOfPips: Int = 1
    
    var body: some View {
        VStack{
            Image(systemName: "die.face.\(numberOfPips)")
                .resizable()
                .frame(width: 100, height: 100)
                .aspectRatio(1, contentMode: .fit)
                .foregroundStyle(.black, .white)
            
            Button("Roll"){
                withAnimation{
                    numberOfPips = Int.random(in: 1...6)
                }
                
            }
            .buttonStyle(.bordered)
        }
    }
}

#Preview {
    DiceView()
}
