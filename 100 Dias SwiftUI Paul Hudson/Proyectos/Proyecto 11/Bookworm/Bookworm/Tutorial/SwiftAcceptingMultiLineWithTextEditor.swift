//
//  SwiftAccepting multi-line text input with TextEditorUIView.swift
//  Bookworm
//
//  Created by Esteban Perez Castillejo on 6/8/24.
//

import SwiftUI

struct SwiftAcceptingMultiLineWithTextEditor: View {
    @AppStorage("notes") private var notes = ""
    @AppStorage("notes") private var notes2 = ""
    
    @State private var isOn: Bool = false
    var body: some View {
        NavigationStack{
            VStack{
                
                Text("Al pulsar en el boton de navergación cambia de TextField a TextEditor").bold()
                if isOn{
                    TextEditor(text: $notes)
                        .navigationTitle("Notes")
                        .padding()
                }else {
                    // este código permite que el area de escritura se expanda conforme el usuario lo llena de texto
                    TextField("Enter your text", text: $notes2, axis: .vertical)
                        .textFieldStyle(.roundedBorder)
                        .navigationTitle("Notes")
                        .padding()
                }
                Spacer()
            }.padding()
            .toolbar{
                ToolbarItem(placement: .automatic, content: {
                    Toggle(isOn ?   "TextEditor" : "TextField", isOn: $isOn)
                })
            }
        }
    }
}

#Preview {
    SwiftAcceptingMultiLineWithTextEditor()
}
