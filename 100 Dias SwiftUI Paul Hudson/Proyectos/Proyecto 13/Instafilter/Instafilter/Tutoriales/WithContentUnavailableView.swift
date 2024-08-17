//
//  ContentUnavailableView.swift
//  Instafilter
//
//  Created by Esteban Perez Castillejo on 17/8/24.
//

import SwiftUI

struct WithContentUnavailableView: View {
    var body: some View {
        
        ///Eso mostrará un gran icono de Swift de SF Symbols, además del texto del título a continuación que dice "No hay fragmentos".
        
         ContentUnavailableView("No snippets", systemImage: "swift")
        
        /// También puede agregar una línea adicional de texto de descripción a continuación, especificada como una vista de texto para que pueda agregar un estilo adicional, como una fuente personalizada o un color personalizado:
        
        ContentUnavailableView("No snippets", systemImage: "swift", description: Text("You don't have any saved snippets yet."))
        
        
        /// Y si desea un control total, puede proporcionar vistas individuales para el título y la descripción, junto con algunos botones para mostrar para ayudar al usuario a comenzar:
        
        ContentUnavailableView {
            Label("No snippets", systemImage: "swift")
        } description: {
            Text("You don't have any saved snippets yet.")
        } actions: {
            Button("Create Snippet") {
                // create a snippet
            }
            .buttonStyle(.borderedProminent)
        }
        
        /// Es una vista muy fácil de usar, ¡pero es mucho mejor que simplemente mostrar una pantalla en blanco cuando el usuario llega por primera vez a tu aplicación!
    }
}

#Preview {
    WithContentUnavailableView()
}
