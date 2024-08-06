//
//   StudentView.swift
//  Bookworm
//
//  Created by Esteban Perez Castillejo on 6/8/24.
//

import SwiftData
import SwiftUI

struct StudentView: View {
    @Query var students: [Student]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack{
            List(students){ students in
                Text(students.name)
            }
            .navigationTitle("Classroom")
            .toolbar{
                Button("Add"){
                    let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                    let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]

                    let chosenFirstName = firstNames.randomElement()!
                    let chosenLastName = lastNames.randomElement()!

                    let student = Student(id: UUID(), name: "\(chosenFirstName) \(chosenLastName)")
                    
                    modelContext.insert(student)
                }
            }
        }
    }
}

#Preview {
    StudentView()
}
