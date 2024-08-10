//
//  TutoPaul.swift
//  SwiftDataProject
//
//  Created by Esteban Perez Castillejo on 10/8/24.
//

import SwiftData
import SwiftUI

struct TutoPaul: View {
    @Environment (\.modelContext) var modelContex
    @Query(sort: \User.name) var users: [User]
    @State private var path = [User]()

    var body: some View {
        NavigationStack(path: $path){
            List(users){ user in
                NavigationLink(value: user){
                    Text(user.name)
                }
            }
            .navigationTitle("Users")
            .navigationDestination(for: User.self){ user in
                EditUserView(user: user)
            }
            . toolbar{
                Button("Add", systemImage: "plus"){
                    let user = User(name: "", city: "", joinDate: .now)
                    modelContex.insert(user)
                    path = [user]
                }

            }
  
        }
        
    }
    
}

#Preview {
    TutoPaul()
}
