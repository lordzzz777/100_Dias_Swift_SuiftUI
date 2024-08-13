//
//  ContentView.swift
//  DecoderJSON
//
//  Created by Esteban Perez Castillejo on 13/8/24.
//

import SwiftUI

struct ContentView: View {
    @State var viewModel = UserViewModel()
   
    @State var isActive: Bool = false
    var body: some View {
        NavigationStack{
            List(viewModel.user, id: \.id){ item in
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
}
