//
//  AddActivitiesView.swift
//  HabitTracking
//
//  Created by Esteban Perez Castillejo on 28/7/24.
//

import SwiftUI

struct AddActivitiesView: View {
    @State private var title: String = ""
    @State private var comment: String = ""
    
    @Environment(\.dismiss) var dismiss
    
    var habitItemsViewModel: HabitItemsViewModel
    
    var body: some View {
        NavigationStack{
            Form{
                Section("Agregar actividad"){
                    TextField("Actividad", text: $title)
                    TextField("Anotaciones", text: $comment)
                }
            }
            .navigationTitle($title)
            
            .toolbar{
                Button("Guardar"){
                    let items = HabitTrackingModel( title: title, comment: comment)
                    habitItemsViewModel.items.append(items)
                    dismiss()
                }.bold().foregroundStyle(.green)
                
                Button(role: .cancel, action: {
                    dismiss()
                }, label: {
                    Text("Cancelar").bold()
                        .foregroundStyle(.red)
                })
            }
        }
    }
}

#Preview {
    AddActivitiesView(habitItemsViewModel: HabitItemsViewModel())
}
