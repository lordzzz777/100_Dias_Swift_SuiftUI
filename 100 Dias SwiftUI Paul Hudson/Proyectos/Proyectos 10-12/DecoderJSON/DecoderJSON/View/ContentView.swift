//
//  ContentView.swift
//  DecoderJSON
//
//  Created by Esteban Perez Castillejo on 13/8/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    
    @Environment(UserViewModel.self) var viewModel
    
    var body: some View {
        NavigationStack{
            List(viewModel.users, id: \.id){ item in
                NavigationLink{ DetailView(usermodel: item)}
                
            label: {
                HStack{
                    Text("\(item.name),").bold()
                    Text("Esta activo:").bold()
                    Text(item.isActive ? "✅" : "❌")
                }
              }
            }
            .navigationTitle("User")
        }
    }
}

#Preview {
    
    ContentView()
        .environment(UserViewModel())
}
