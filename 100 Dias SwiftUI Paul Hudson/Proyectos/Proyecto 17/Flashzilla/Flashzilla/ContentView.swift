//
//  ContentView.swift
//  Flashzilla
//
//  Created by Esteban Pérez Castillejo on 22/9/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var accessibilityDifferentiateWithoutColor
    @Environment(\.scenePhase) var scenePhase
    @Environment(\.accessibilityVoiceOverEnabled) var accessibilityVoiceOverEnabled
    
    @State private var isActive = true
    @State private var showingEditScreen = false
    @State private var cards = [Card]()
    @State private var timeRemaining = 100
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Image(decorative: "background")
                    .resizable()
                    .ignoresSafeArea()
            
            VStack {
                Text("Time: \(timeRemaining)")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                    .background(.black.opacity(0.75))
                    .clipShape(.capsule)
                   
                
                ZStack {
//                    ForEach(cards) { index in
//                        CardView(card: cards[index]){
//                            withAnimation{
//                                removeCard(at: index)
//                                
//                            }
//                            if cards.isEmpty {
//                                isActive = false
//                            }
//                        }
//                            .stacked(at: index, in: cards.count)
//                            .allowsHitTesting(index == cards.count - 1)
//                            .accessibilityHidden(index < cards.count - 1)
//                    }
                    ForEach(cards) { card in
                        CardView(card: card) {
                            withAnimation {
                                removeCard(card)
                            }
                            if cards.isEmpty {
                                isActive = false
                            }
                        }
                        .stacked(at: cards.firstIndex(where: { $0.id == card.id }) ?? 0, in: cards.count)
                        .allowsHitTesting(card == cards.last)
                        .accessibilityHidden(card != cards.last)
                    }
                }
                .allowsHitTesting(timeRemaining > 0)
                if cards.isEmpty {
                    Button("Start Again", action: resetCards)
                        .padding()
                        .background(.white)
                        .foregroundStyle(.black)
                        .clipShape(.capsule)
                }
            }
            VStack {
                HStack {
                    Spacer()

                    Button {
                        showingEditScreen = true
                    } label: {
                        Image(systemName: "plus.circle")
                            .padding()
                            .background(.black.opacity(0.7))
                            .clipShape(.circle)
                    }
                }

                Spacer()
            }
            .foregroundStyle(.white)
            .font(.largeTitle)
            .padding()
//            if accessibilityDifferentiateWithoutColor || accessibilityVoiceOverEnabled {
//                VStack {
//                    Spacer()
//
//                    HStack {
//                        Button {
//                            withAnimation {
//                                removeCard(at: cards.count - 1)
//                            }
//                        } label: {
//                            Image(systemName: "xmark.circle")
//                                .padding()
//                                .background(.black.opacity(0.7))
//                                .clipShape(.circle)
//                        }
//                        .accessibilityLabel("Wrong")
//                        .accessibilityHint("Mark your answer as being incorrect.")
//
//                        Spacer()
//
//                        Button {
//                            withAnimation {
//                                removeCard(at: cards.count - 1)
//                            }
//                        } label: {
//                            Image(systemName: "checkmark.circle")
//                                .padding()
//                                .background(.black.opacity(0.7))
//                                .clipShape(.circle)
//                        }
//                        .accessibilityLabel("Correct")
//                        .accessibilityHint("Mark your answer as being correct.")
//                    }
//                    .foregroundStyle(.white)
//                    .font(.largeTitle)
//                    .padding()
//                }
//            }
            if accessibilityDifferentiateWithoutColor || accessibilityVoiceOverEnabled {
                VStack {
                    Spacer()

                    HStack {
                        Button {
                            withAnimation {
                                removeCard(cards.last!, addBack: true)  // Volvemos a agregar si la respuesta es incorrecta
                            }
                        } label: {
                            Image(systemName: "xmark.circle")
                                .padding()
                                .background(.black.opacity(0.7))
                                .clipShape(.circle)
                        }
                        .accessibilityLabel("Wrong")
                        .accessibilityHint("Mark your answer as being incorrect.")

                        Spacer()

                        Button {
                            withAnimation {
                                removeCard(cards.last!)  // Eliminamos si la respuesta es correcta
                            }
                        } label: {
                            Image(systemName: "checkmark.circle")
                                .padding()
                                .background(.black.opacity(0.7))
                                .clipShape(.circle)
                        }
                        .accessibilityLabel("Correct")
                        .accessibilityHint("Mark your answer as being correct.")
                    }
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .padding()
                }
            }

        }
        .sheet(isPresented: $showingEditScreen, onDismiss: resetCards) {
            EditCards()
        }
        /// Podemos pasar el inicializador de EditCards directamente a la hoja, así...
        /// `.sheet(isPresented: $showingEditScreen, onDismiss: resetCards, content: EditCards.init)`
        .onAppear(perform: resetCards)
        .onReceive(timer) { time in
            guard isActive else { return }

            if timeRemaining > 0 {
                timeRemaining -= 1
            }
        }
        .onChange(of: scenePhase) {
            if scenePhase == .active {
                if cards.isEmpty == false {
                    isActive = true
                }
            } else {
                isActive = false
            }
        }
    }
    
//    func removeCard(at index: Int) {
//        guard index >= 0 else { return }
//        cards.remove(at: index)
//    }
    
    func removeCard(_ card: Card, addBack: Bool = false) {
        guard let index = cards.firstIndex(where: { $0.id == card.id }) else { return }
        let removedCard = cards.remove(at: index)
        
        if addBack {
            cards.append(removedCard)  // Volvemos a agregar la tarjeta al final
        }
    }
    
    func resetCards() {
      // cards = Array<Card>(repeating: .example, count: 10)
        timeRemaining = 100
        isActive = true
        loadData()
    }
    
    func loadData() {
        if let data = UserDefaults.standard.data(forKey: "Cards") {
            if let decoded = try? JSONDecoder().decode([Card].self, from: data) {
                cards = decoded
            }
        }
        
    }
}

#Preview {
    ContentView()
}


extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = Double(total - position)
        return self.offset(y: offset * 10)
    }
}
