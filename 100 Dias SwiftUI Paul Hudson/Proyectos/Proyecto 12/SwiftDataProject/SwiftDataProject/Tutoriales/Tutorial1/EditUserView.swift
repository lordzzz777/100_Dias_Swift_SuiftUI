//
//  EditUserView.swift
//  SwiftDataProject
//
//  Created by Esteban Perez Castillejo on 10/8/24.
//

import SwiftUI
import SwiftData

struct EditUserView: View {
    @Bindable var user: User
    
    var body: some View {
        Form{
            TextField("name", text: $user.name)
            TextField("City", text: $user.city)
        }
        .navigationTitle("Edit User")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    do{
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: User.self, configurations: config)
        let user = User(name: "Paco el del taco", city: "Cadiz", joinDate: .now)
        
        return EditUserView(user: user)
            .modelContainer(container)
    }catch{
        return Text("Fallo al crear el contenedor: \(error.localizedDescription)")
    }
    
}
