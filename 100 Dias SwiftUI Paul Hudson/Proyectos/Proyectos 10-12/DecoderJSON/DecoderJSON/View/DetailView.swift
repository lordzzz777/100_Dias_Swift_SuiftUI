//
//  DetailView.swift
//  DecoderJSON
//
//  Created by Esteban Perez Castillejo on 13/8/24.
//

import SwiftUI

struct DetailView: View {
    var usermodel: User
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading){
                HStack{
                    Text("Nombre: ").font(.title2).bold()
                    Text( usermodel.name)
                }.padding(.top)
                
                HStack{
                    Text("edad: ").font(.title2).bold()
                    Text(String( usermodel.age))
                }.padding(.top)
                
                HStack{
                    Text("Centro de trabajo: ").font(.title2).bold()
                    Text(usermodel.company).bold()
                }.padding(.top)
                
                
                Text("Dirección:").font(.title2).bold().padding(.top)
                Text(usermodel.address)
                Text("Email:").font(.title2).bold().padding(.top)
                Text(usermodel.email).bold()
                
                Text("acerca de ...").font(.title2).bold().padding(.top)
                Text(usermodel.about)
                HStack{
                    ScrollView{
                        Text("Etiquetas:").font(.title2).bold()
                        ForEach(usermodel.tags, id: \.self){ tag in
                            Text(tag)
                        }
                    }
                    Spacer()
                    ScrollView{
                        Text("Amigos:").font(.title2).bold()
                        ForEach(usermodel.friends, id: \.id){ friends in
                            Text(friends.name)
                            let _ = print(friends.name)
                        }
                    }
                    
                }
            }.padding()
        }
    }
}

