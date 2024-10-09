//
//  Tutorial4.swift
//  SnowSeeker
//
//  Created by Esteban Pérez Castillejo on 9/10/24.
//
//  Haciendo que una vista de SwiftUI se pueda buscar

import SwiftUI

/// iOS puede agregar una barra de búsqueda a nuestras vistas usando el modificador searchable(), y podemos vincular una propiedad de cadena a ella para filtrar nuestros datos a medida que el usuario escribe.

/// Para ver cómo funciona esto, pruebe este sencillo ejemplo:
struct Tutorial4: View {
    
    /// Importante: Debe asegurarse de que su vista esté dentro de un NavigationStack, de lo contrario iOS no tendrá ningún lugar para poner el cuadro de búsqueda.
    
    /// Cuando ejecute ese ejemplo de código, debería ver una barra de búsqueda en la que puede escribir, y lo que escriba se mostrará en la vista a continuación.

    /// En la práctica, searchable() se usa mejor con algún tipo de filtrado de datos. Recuerde, SwiftUI volverá a invocar su propiedad de cuerpo cuando cambie una propiedad @State, por lo que podría usar una propiedad calculada para manejar el filtrado real:
    @State private var searchText = ""
    
    let allNames = ["Subh", "Vina", "Melvin", "Stefanie"]

    var filteredNames: [String] {
        if searchText.isEmpty {
            allNames
        } else {
            allNames.filter { $0.localizedStandardContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationStack {
            List(filteredNames, id: \.self) { name in
                Text(name)
            }
            .searchable(text: $searchText, prompt: "Look for something")
            .navigationTitle("Searching")
        }
    }
}

#Preview {
    Tutorial4()
}
