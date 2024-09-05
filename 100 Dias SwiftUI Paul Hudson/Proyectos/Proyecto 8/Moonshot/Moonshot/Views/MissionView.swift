//
//  MissionView.swift
//  Moonshot
//
//  Created by Esteban Perez Castillejo on 19/7/24.
//

import SwiftUI

struct MissionView: View {
    
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    let mission: Mission
    let crew: [CrewMember]
    
    var body: some View {
        ScrollView{
            VStack{
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width, axos in
                        width * 0.6
                    }
                    .accessibilityLabel("Imagen de la misión \(mission.displayName)")

                
                VStack(alignment: .leading){
                    Rectangle()
                        .frame(height: 2)
                        .foregroundStyle(.lightBackground)
                        .padding(.vertical)
                        .accessibilityHidden(true)
                    
                    //HStack {
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .accessibilityAddTraits(.isHeader)
                    Text(mission.formattedLaunchDate) //Se añade la fecha de lanzamiento
                        .font(.system(size: 15).bold())
                        .foregroundStyle(.white.opacity(0.5))
                        .padding(.bottom,5)
                        
                //    }
                    Text(mission.description)
                        .accessibilitySortPriority(1)
                    
                    Rectangle()
                        .frame(height: 2)
                        .foregroundStyle(.lightBackground)
                        .padding(.vertical)
                        .accessibilityHidden(true)
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                        .accessibilitySortPriority(0)
                }
                .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(crew, id: \.role){ crewMember in
                            NavigationLink{
                                AstronautView(astronaut: crewMember.astronaut)
                            } label :{
                                HStack{
                                    Image(crewMember.astronaut.id)
                                        .resizable()
                                        .frame(width: 104, height: 72)
                                        .clipShape(.capsule)
                                        .overlay(
                                            Capsule()
                                                .strokeBorder(.white, lineWidth: 1)
                                        )
                                        .accessibilityLabel("Foto del astronauta \(crewMember.astronaut.name)")
                                    VStack(alignment: .leading) {
                                        Text(crewMember.astronaut.name)
                                            .foregroundStyle(.white)
                                            .font(.headline)
                                            .accessibilityLabel("Nombre del astronauta: \(crewMember.astronaut.name)")
                                        Text(crewMember.role)
                                            .foregroundStyle(.white.opacity(0.5))
                                            .accessibilityLabel("Rol: \(crewMember.role)")
                                    }
                                }
                                .padding(.horizontal)
                            }
                            .accessibilityLabel("Ver detalles del astronauta \(crewMember.astronaut.name)")
//                            NavigationLink("\(crewMember.astronaut.name)", value: crewMember.role)
                        }
//                        .navigationDestination(for: String (crew.role)){ select in
//                            AstronautView(astronaut: select.astronaut)
//                        }

                    }
                }
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]){
        self.mission = mission
        
        self.crew = mission.crew.map{ member in
            if let astronaut =  astronauts[member.name]{
                return CrewMember(role: member.role, astronaut: astronaut)
            }else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}

#Preview {
    
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    return MissionView(mission: missions[0], astronauts: astronauts)
        .preferredColorScheme(.dark)
}
