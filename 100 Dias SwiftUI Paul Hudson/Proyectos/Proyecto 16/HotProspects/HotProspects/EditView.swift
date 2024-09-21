//
//  EditView.swift
//  HotProspects
//
//  Created by Esteban Pérez Castillejo on 21/9/24.
//

import SwiftData
import SwiftUI

struct EditView: View {
    @Environment(\.modelContext) var context
    @Bindable var model: Prospect
    @State private var isShow = false
    
    var body: some View {
        ZStack{

                MeshGradient(width: 3, height: 3, points: [
                    .init(0, 0), .init(0.5, 0), .init(1, 0),
                    .init(0, 0.5), .init(0.5, 0.5), .init(1, 0.5),
                    .init(0, 1), .init(0.5, 1), .init(1, 1)
                ], colors: [
                    .red, .purple, .indigo,
                    .orange, .white, .blue,
                    .yellow, .green, .mint
                ])
                .ignoresSafeArea()

            VStack{
                TextField("Nombrte", text: $model.name)
                    .textFieldStyle(.roundedBorder)
                    .shadow(radius: 10)
                    .padding(.bottom, 30)
                TextField("Nombrte", text: $model.emailAddress)
                    .textFieldStyle(.roundedBorder)
                    .shadow(radius: 10)
                    .padding(.bottom, 30)
                HStack{
                    Button(action: {
                        model.isPotential.toggle()
                        
                    }, label: {
                        
                        Text("Contacto Potencia").font(.title).bold()
                            .tint(.black).padding(.horizontal,10)
                        
                        Image(systemName: "star.fill")
                            .tint(model.isPotential ? .yellow : .gray).font(.title)
                            .bold()
                    }).padding(.bottom, 30)
                    Spacer()
                }
                Button(action: {
                    let modelData = Prospect(name: model.name, emailAddress: model.emailAddress, isContacted: true)
                    context.insert(modelData)

                }, label: {
                    Text("Save").font(.title2).bold().tint(.black)
                        .foregroundStyle(.black)
                        .padding()
                }).buttonStyle(BorderedButtonStyle()).tint(.green).border(.regularMaterial)
                    .shadow(radius: 12)
                    
                
            }.padding()
            
        }
    }
}

#Preview {
    @Previewable @State var model = Prospect(name: "Lordzzz", emailAddress: "yomismo@eso.com", isContacted: true, isPotential: true)
    EditView(model: model)
        .modelContainer(for: Prospect.self)
}
