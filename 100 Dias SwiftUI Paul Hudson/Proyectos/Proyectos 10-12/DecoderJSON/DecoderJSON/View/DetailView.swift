//
//  DetailView.swift
//  DecoderJSON
//
//  Created by Esteban Perez Castillejo on 13/8/24.
//

import SwiftUI

struct DetailView: View {
    @State var usermodel: User
    @State var friend = Friend(id: "", name: "")
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
                        }
                    }
                    
                }
            }.padding()
        }
    }
}

#Preview {
    @State var friend = Friend(id: "91b5be3d-9a19-4ac2-b2ce-89cc41884ed0", name: "Hawkins Patel")
    @State var usermodel = User(id: "50a48fa3-2c0f-4397-ac50-64da464f9954", isActive: false, name: "Alford Rodriguez", age: 21, company: "Imkan", email: "alfordrodriguez@imkan.com", address: "907 Nelson Street, Cotopaxi, South Dakota, 5913", about: "Occaecat consequat elit aliquip magna laboris dolore laboris sunt officia adipisicing reprehenderit sunt. Do in proident consectetur labore. Laboris pariatur quis incididunt nostrud labore ad cillum veniam ipsum ullamco. Dolore laborum commodo veniam nisi. Eu ullamco cillum ex nostrud fugiat eu consequat enim cupidatat. Non incididunt fugiat cupidatat reprehenderit nostrud eiusmod eu sit minim do amet qui cupidatat. Elit aliquip nisi ea veniam proident dolore exercitation irure est deserunt.", registered: Date(), tags: ["cillum", "consequat", "deserunt"], friends: [friend])
    
    
    return DetailView(usermodel: usermodel, friend: friend)
}
