//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Lordzzz on 22/5/24.
//

import SwiftUI

struct ContentView: View {
    @State private var punctuation = 0
    @State private var showingScore = false
    @State private var isAlertInfo = false
    @State private var messageInfo = ""
    @State private var scoreTitle = ""
    @State private var questionNumber = 0
  
   @State private var countries = [
    "Estonia", "Francia", "Germany", "Ireland", "Ilaly", "Nigeria", "Polonia", "España", "Rusia", "UKrania", "US"
    ]
    
    @State private var correctaAnswer = Int.random(in: 0...2)
    
    var body: some View {
        
        ZStack{
            RadialGradient(stops:[
                .init(color: .blue, location: 0.3),
                .init(color: .red, location: 0.3)
            ], center: .top, startRadius: 200,endRadius: 700)
            .ignoresSafeArea()
            
            VStack(spacing: 15) {
                HStack{
                    Button(action: {
                        resetGame()
                    }, label: {
                        Text("reinicio").bold()
                            .padding(3)
                    }) .buttonStyle(.borderedProminent)
                        .tint(.red)
                    Spacer()
                    Text("Puntuació: \(punctuation)")
                        .font(.title2.weight(.bold))
                        .foregroundStyle(.cyan)
                }.padding()
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
/* reemplace la vista de imagen utilizada para las banderas con una nueva vista FlagImage() que muestre una imagen de bandera utilizando el conjunto específico de modificadores que teníamos.
    "Image(countries[number]).clipShape(.capsule).shadow(radius: 5)"
*/
                        FlagImage(countries: countries, number: number)
                    }
                    
                }
                .alert(scoreTitle, isPresented: $showingScore){
                    if questionNumber < 8 {
                        Button("Continue", action: askQuestion)
                    } else {
                        Button("Continue", action: resetGame)
                    }
                } message: {
                    Text("¿Tu puntuación es? \(punctuation)")
                    
                }
                
                .alert("" ,isPresented: $isAlertInfo){
                    Button("Continue", action: askQuestion)
                } message: {
                    Text(messageInfo)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .background(.regularMaterial)
            .clipShape(.rect(cornerRadius: 20))
            .padding(4)
        }
    
    }
    
    func flagTapped(_ number: Int) {
        if number == correctaAnswer {
            scoreTitle = "Correcto"
            punctuation += 10
        }else {
            scoreTitle = "Incorrecto"
            punctuation -= 5
            messageInfo = "Esa es la bandera de \(countries[correctaAnswer])"
            isAlertInfo = true
        }
        showingScore = true
        questionNumber += 1
    }
    
   func askQuestion(){
       if questionNumber < 8 {
           countries.shuffle()
           correctaAnswer = Int.random(in: 0...2)
       }else {
           resetGame()
       }
    }
    
    func resetGame(){
        questionNumber = 0
        punctuation = 0
        askQuestion()
    }
}

#Preview {
    ContentView()
}
