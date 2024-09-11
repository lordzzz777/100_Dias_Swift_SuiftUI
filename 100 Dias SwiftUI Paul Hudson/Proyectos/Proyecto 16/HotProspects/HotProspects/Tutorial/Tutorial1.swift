//
//  Tutorial1.swift
//  HotProspects
//
//  Created by Esteban Perez Castillejo on 11/9/24.
//

import SwiftUI

struct Tutorial1: View {

    // para seleccionar un valor
   // @State private var selection: String?
    
    // Para seseleccionar un conjunto de valores
    @State private var selection = Set<String>()
    
    let users = ["Tohru", "Yuki", "Kyo", "Momiji"]
    
    var body: some View {
        NavigationStack{
            List(users, id: \.self, selection: $selection) { user in
                Text(user)
                
            }
            .toolbar{
                EditButton()
            }
            //        if let selection {
            //            Text("You selected \(selection)")
            //        }
            if selection.isEmpty == false {
                Text("You selected \(selection.formatted())")
            }
                
        }
    }
}

#Preview {
    Tutorial1()
}
