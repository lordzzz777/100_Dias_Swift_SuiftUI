//
//  Tutorial2.swift
//  SnowSeeker
//
//  Created by Esteban Pérez Castillejo on 9/10/24.
//
//  Usando alert() y sheet() con opciones

import SwiftUI

struct Tutorial2: View {
    @State private var selectedUser: User? = nil
    @State private var isShowingUser = false
    
    var body: some View {
        Button("Tap Me") {
//            selectedUser = User()
            isShowingUser = true
        }
//        .sheet(item: $selectedUser) { user in
//            Text(user.id)
//        Text(selectedUser.id)
//            .presentationDetents([.medium, .large])
//        }
        .alert("Welcome", isPresented: $isShowingUser, presenting: selectedUser) { user in
            Button(user.id) { }
        }
    }
}

#Preview {
    Tutorial2()
}

struct User: Identifiable {
    var id = "Taylor Swift"
}
