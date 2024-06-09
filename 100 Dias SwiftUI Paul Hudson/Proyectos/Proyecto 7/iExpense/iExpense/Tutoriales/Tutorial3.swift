//
//  Tutorial3.swift
//  iExpense
//
//  Created by Esteban Pérez Castillejo on 9/6/24.
//

import SwiftUI

struct Tutorial3: View {
    @State private var numbers = [Int]()
    @State private var currentNumbers = 1
    
    var body: some View {
        NavigationStack{
            VStack{
                List{
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRow)
                }
                Button("Add Number"){
                    numbers.append(currentNumbers)
                    currentNumbers += 1
                }
            }
            .toolbar{
                EditButton()
            }
        }
    }
    
    func removeRow(at offsets: IndexSet){
        numbers.remove(atOffsets: offsets)
    }
}

#Preview {
    Tutorial3()
}
