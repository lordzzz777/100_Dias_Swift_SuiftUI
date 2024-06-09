//
//  Tutorial2.swift
//  iExpense
//
//  Created by Esteban Pérez Castillejo on 9/6/24.
//

import SwiftUI

struct Tutorial2: View {
    @State private var showingSheet = false
    
    var body: some View {
        VStack {
            Button("Show Sheet") {
                showingSheet.toggle()
                  }
        }
        .padding()
        .sheet(isPresented: $showingSheet, content: {
            SecondView(name: "@twostraws")
        })
    }
}

// Vista de Hoja modal
struct SecondView: View {
    @Environment (\.dismiss) var dismiss
    
    let name: String
    
    var body: some View {
        Text("Hello, \(name)!")
        Button("Dismiss"){
            dismiss()
        }
    }
}


#Preview {
    Tutorial2()
}
