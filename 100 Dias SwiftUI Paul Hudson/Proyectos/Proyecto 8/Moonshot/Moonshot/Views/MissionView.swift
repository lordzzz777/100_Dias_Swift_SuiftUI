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

                
                VStack(alignment: .leading){
                    Rectangle()
                        .frame(height: 2)
                        .foregroundStyle(.lightBackground)
                        .padding(.vertical)
                    
                    //HStack {
                    Text("Mission Highlights")
                        .font(.title.bold())
                    Text(mission.formattedLaunchDate) //Se añade la fecha de lanzamiento
                        .font(.system(size: 15).bold())
                        .foregroundStyle(.white.opacity(0.5))
                        .padding(.bottom,5)
                        
                //    }
                    Text(mission.description)
                    
                    Rectangle()
                        .frame(height: 2)
                        .foregroundStyle(.lightBackground)
                        .padding(.vertical)
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom, 5)
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
                                    VStack(alignment: .leading) {
                                        Text(crewMember.astronaut.name)
                                            .foregroundStyle(.white)
                                            .font(.headline)
                                        Text(crewMember.role)
                                            .foregroundStyle(.white.opacity(0.5))
                                    }
                                }
                                .padding(.horizontal)
                            }
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
