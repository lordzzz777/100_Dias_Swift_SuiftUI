//
//  Tutorial3.swift
//  Navigation
//
//  Created by Esteban Perez Castillejo on 22/7/24.
//

import SwiftUI

struct Tutorial3: View {
    
    @State private var path = [Int]()
    
    var body: some View {
        
        NavigationStack(path: $path){
            
            VStack {
                VStack{
                    Text("Navegación programática ")
                    Text("con NavigationStack")
                    Rectangle().frame(width: 393,height: 4)
                        .foregroundStyle(.red)
                        .padding()
                }
            }.font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/.bold())
            ScrollView{
                Text(textmodel1).bold().padding()
            }
            VStack{
                Rectangle()
                    .foregroundStyle(.orange)
                    .overlay{
                        ScrollView {
                            VStack(alignment: .leading){
                               
                                
                                HStack{
                                    Text("👉🏻").font(.system(size: 70))
                                    Button("Show 32") {
                                        
                                        path = [32]
                                    }
                                }.font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
                                Text(textmodel2).bold()
                            }
                        }
                        .padding()
                    }
            } // boton 1
            VStack{
                Rectangle()
                    .foregroundStyle(.yellow)
                    .overlay{
                        ScrollView {
                            VStack(alignment: .leading){
                               
                                HStack{
                                    Text("👉🏻").font(.system(size: 70))
                                    Button("Show 64") {
                                        path.append(64)
                                    }.font(.title).bold()
                                        .padding()
                                }
                                Text(textmodel3).bold()
                            }
                        }.padding()
                    }
                
            } // boton 2
            VStack{
                Rectangle()
                    .foregroundStyle(.gray)
                    .overlay{
                        ScrollView {
                            VStack(alignment: .leading) {
                                
                                HStack{
                                    Text("👉🏻").font(.system(size: 70))
                                    Button("Show 32 then 64") {
                                        path = [32, 64]
                                    }.font(.title).bold()
                                        .padding()
                                }
                                Text(textmodel4).bold()
                            }
                        }.padding()
                    }
            } // boton 3
            
            
            .navigationDestination(for: Int.self){ selection in
                Text("You selected \(selection)")
                
                
            }
            
        }
    }
    
}

#Preview {
    Tutorial3()
}
