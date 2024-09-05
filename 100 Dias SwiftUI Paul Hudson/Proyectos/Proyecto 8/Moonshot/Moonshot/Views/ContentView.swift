//
//  ContentView.swift
//  Moonshot
//
//  Created by Esteban Perez Castillejo on 11/6/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showingGrid = false
    
    let astronauts:[String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let columns = [GridItem(.adaptive(minimum: 150))]
    
    
    var body: some View {
        NavigationStack {
            Group{
                if showingGrid {
                    ScrollView {
                        LazyVGrid(columns: columns) {
                            ForEach(missions) { mission in 
                                NavigationLink {
                                    MissionView(mission: mission, astronauts: astronauts)
                                } label: {
                                    VStack {
                                        Image(mission.image)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 100, height: 100)
                                            .padding()
                                            .accessibilityLabel("Imagen de la misión \(mission.displayName)")

                                        
                                        VStack {
                                            Text(mission.displayName)
                                                .font(.headline)
                                                .foregroundStyle(.white)
                                            Text(mission.formattedLaunchDate)
                                                .font(.caption)
                                                .foregroundStyle(.white.opacity(0.5))
                                        }
                                        .padding(.vertical)
                                        .frame(maxWidth: .infinity)
                                        .background(.lightBackground)
                                        .accessibilityLabel("\(mission.displayName), \(mission.formattedLaunchDate)")

                                    }
                                    .clipShape(.rect(cornerRadius: 10))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(.lightBackground)
                                    )
                                }
                            }
                        }
                        .padding([.horizontal, .bottom])
                    }
                }else {
                    List(missions) { mission in
                        NavigationLink {
                            MissionView(mission: mission, astronauts: astronauts)
                        } label: {
                            HStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding()
                                    .accessibilityLabel("Imagen de la misión \(mission.displayName)")

                                
                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundStyle(.white)
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                        .foregroundStyle(.white.opacity(0.5))
                                }
                                .padding(.vertical, 50)
                                .frame(maxWidth: .infinity)
                                .background(.lightBackground)
                                .accessibilityLabel("\(mission.displayName), \(mission.formattedLaunchDate)")

                            }
                            .clipShape(.rect(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBackground)
                            )
                            
                        }
                    }
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar{
                ToolbarItem(placement: .automatic, content: {
                    Button(action: {
                        withAnimation(.easeIn(duration: 0.6), {
                            showingGrid.toggle()
                        })
                        
                    }, label: {
                        withAnimation(.easeIn(duration: 0.6), {
                            Image(systemName: showingGrid ? "square.split.2x2.fill" : "list.bullet" )
                                .foregroundStyle(.white.opacity(0.5))
                                .accessibilityLabel(showingGrid ? "Mostrar en lista" : "Mostrar en cuadrícula")
                                .accessibilityHint("Alterna entre vista en cuadrícula y lista")
                        })
                    })
                })
            }
        }
    }
}

#Preview {
    ContentView()
}
