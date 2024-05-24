//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Lordzzz on 22/5/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
   @State private var countries = [
    "Estonia", "Francia", "Germany", "Ireland", "Ilaly", "Nigeria", "Polonia", "España", "Rusia", "UKrania", "US"
    ]
    
    @State private var correctaAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack{
//            LinearGradient(colors: [.blue, .black ], startPoint: .top, endPoint: .bottom)
//                .ignoresSafeArea()
            
            RadialGradient(stops:[
                .init(color: .blue, location: 0.3),
                .init(color: .red, location: 0.3)
            ], center: .top, startRadius: 200,endRadius: 700)
            .ignoresSafeArea()
            
            VStack(spacing: 15) {
                Text("Toca la bandera de")
                    .font(.subheadline.weight(.heavy))
                    .foregroundStyle(.white)
                
                Text(countries[correctaAnswer])
                    .font(.largeTitle.weight(.semibold))
                    .foregroundStyle(.white)
                
                ForEach(0..<3) { number in
                    Button{
                        flagTapped(number)
                    } label: {
                        Image(countries[number])
                            .clipShape(.capsule)
                            .shadow(radius: 5)
                    }
                    
                }
                .alert(scoreTitle, isPresented: $showingScore){
                    Button("Continue", action: askQuestion)
                } message: {
                    Text("¿Tu puntuación es?")
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .background(.regularMaterial)
            .clipShape(.rect(cornerRadius: 20))
          
        }
    
    }
    
    func flagTapped(_ number: Int) {
        if number == correctaAnswer {
            scoreTitle = "Correct"
        }else {
            scoreTitle = "Wrong"
        }
        showingScore = true
    }
    
   func askQuestion(){
        countries.shuffle()
        correctaAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
