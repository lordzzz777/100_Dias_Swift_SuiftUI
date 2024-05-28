//
//  Home.swift
//  HandDuel
//
//  Created by Esteban Perez Castillejo on 28/5/24.
//

import SwiftUI

struct Home: View {
    @State private var options = ["Piedra 👊", "Papel ✋", "Tijeras ✌️"]
    @State private var currentSelection = ""
    @State private var messagenStutus = ""
    @State private var scorePoint = 0
    @State private var isResultGame = false
    @State private var isShowAlert = false
    
    func result(_ playerSelection: String)  {
        
        let appChoiceIndex = Bool.random() ? 0 : 1
        currentSelection = options[appChoiceIndex]
        
        switch (currentSelection, playerSelection){
        case ("Piedra 👊", "Tijeras ✌️"), ("Papel ✋", "Piedra 👊"), ("Tijeras ✌️", "Papel ✋"):
            messagenStutus = "!Has perdido¡"
            isResultGame = false
           
        case ("Tijeras ✌️", "Piedra 👊"), ("Piedra 👊", "Papel ✋"), ("Papel ✋", "Tijeras ✌️"):
            messagenStutus = "!Has Ganado¡"
            scorePoint += 1
            isResultGame = true
            
        default:
            messagenStutus = "!Empate!"
            isResultGame = false
        }
    }
    
    func resetGame(){
        currentSelection = ""
        messagenStutus = ""
        scorePoint = 0
        isResultGame = false
    }
    
    var body: some View {
        NavigationStack{
            ZStack {
                RadialGradient(stops:[
                    .init(color: .blue, location: 0.5),
                    .init(color: .purple, location: 0.5)
                ], center: .top, startRadius: 200,endRadius: 700)
                .ignoresSafeArea()
                VStack(alignment: .leading){
                    
                    Text("Resultado: \(isResultGame ? messagenStutus : messagenStutus)")
                        .font(.title3).bold().padding(.top, -240)
                        .foregroundStyle(.white)
                    
                    Text(" \(currentSelection)")
                        .font(.title).bold().padding(.top, -140)
                        .foregroundStyle(.white)
                    
                    HStack {
                        
                        Button(action: {
                            result("Piedra 👊")
                        }) {
                            Text("👊")
                                .font(.system(size: 80))
                        }.padding()
                        
                        Button(action: {
                            result("Papel ✋")
                        }) {
                            Text("✋")
                                .font(.system(size: 80))
                        }.padding()
                        
                        Button(action: {
                            result("Tijeras ✌️")
                        }) {
                            Text("✌️")
                                .font(.system(size: 80))
                        }
                        
                    }.background(.regularMaterial)
                        .clipShape(.rect(cornerRadius: 20))
                }
                .alert("", isPresented: $isShowAlert) {
                    Button(role: .cancel, action: {
                        //...
                    }, label: {
                        Text("Cancelar")
                    })
                    
                    Button("Ok", action: resetGame)
                    
                } message: {
                    Text("¿Estas segura de reiniciar el Juego")
                }
                
                .toolbar{
                    ToolbarItem(placement: .navigation, content: {
                        Button(action: {
                            isShowAlert.toggle()
                        }, label: {
                            Text("reinicio" ).bold()
                            Image(systemName: "arrowshape.turn.up.left.circle")
                        }).buttonStyle(.borderedProminent)
                            .tint(.red)
                    })
                    
                    ToolbarItem(placement: .automatic, content: {
                        Group{
                            Text("Puntación: \(scorePoint)").font(.title3).bold()
                                .foregroundStyle(.white)
                        }
                    })
                }
            }
        }.background(.regularMaterial)
     
    }
}

#Preview {
    Home()
}
