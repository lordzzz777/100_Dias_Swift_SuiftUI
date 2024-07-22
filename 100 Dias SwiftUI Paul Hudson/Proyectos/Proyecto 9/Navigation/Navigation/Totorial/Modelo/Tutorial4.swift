//
//  Tutorial4.swift
//  Navigation
//
//  Created by Esteban Perez Castillejo on 22/7/24.
//

import SwiftUI

struct Tutorial4: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        
        NavigationStack(path: $path){
            List{
                ForEach(0..<5) { i in
                    NavigationLink("Select Numbers \(i)", value: i)
                }
                ForEach(0..<5) { i in
                    NavigationLink("Select Numbers \(i)", value: String(i))
                }
            }
            .toolbar{
                Button("Push 556"){
                    path.append(556)
                }
                
                Button("Push Hollo"){
                    path.append("Hello")
                }
            }
            .navigationDestination(for: Int.self){ selection in
                Text("You selected the number \(selection)")
            }
            
            .navigationDestination(for: String.self) { selection in
                Text("You selected the string \(selection)")
            }
        }
    }
}

#Preview {
    Tutorial4()
}
