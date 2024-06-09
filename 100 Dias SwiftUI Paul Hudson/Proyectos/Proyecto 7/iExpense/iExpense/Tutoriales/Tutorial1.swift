//
//  Tutorial1.swift
//  iExpense
//
//  Created by Esteban Pérez Castillejo on 9/6/24.
//

import SwiftUI
import Observation

@Observable
class User {
    var firstName = "Bilbo"
    var lastName = "Baggins"
}

struct Tutorial1: View {
    @State private var user = User()
    
    var body: some View {
        VStack{
            Text("Your name is \(user.firstName) \(user.lastName).")
            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
        }.padding()
    }
}

#Preview {
    Tutorial1()
}
