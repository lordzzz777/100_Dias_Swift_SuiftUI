//
//  Tutorial6.swift
//  Navigation
//
//  Created by Esteban Perez Castillejo on 22/7/24.
//

import SwiftUI
import Observation

// principal
struct Tutorial6: View {
    @State private var pathStore = PathStore()
    
    var body: some View {
        Text("Cómo guardar las rutas de NavigationStack usando Codable")
            .font(.system(size: 30).bold()).padding()
        NavigationStack(path: $pathStore.path) {
            DetailView(number: 0)
                .navigationDestination(for: Int.self) { i in
                    DetailView(number: i)
                }
        }
    }
}

// Viasta de detalles
struct DetailView3: View {
    var number: Int

    var body: some View {
        NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
    }
}


@Observable
class PathStore {
    
    /*
    var path: [Int] {
        didSet {
            save()
        }
    }
     Si estás usando NavigationPath, solo necesitas cuatro pequeños cambios.

     En primer lugar, la propiedad de la ruta debe tener el tipo NavigationPath en lugar de [Int]:
*/
    
    var path: NavigationPath {
        didSet {
            save()
        }
    }
    
    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")

    init() {
        if let data = try? Data(contentsOf: savePath) {
// 
//            if let decoded = try? JSONDecoder().decode([Int].self, from: data) {
//                path = decoded
//                return
//            }
// En segundo lugar, cuando decodificamos nuestro JSON en el inicializador, necesitamos decodificar a un tipo específico, luego usar los datos decodificados para crear una nueva ruta de navegación:
            if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
                path = NavigationPath(decoded)
                return
            }
            
        }

        // Still here? Start with an empty path.
       // path = []
        // En tercer lugar, si la decodificación falla, debemos asignar una nueva instancia vacía de NavigationPath a la propiedad de ruta al final del inicializador:
        path = NavigationPath()
    }

    func save() {
        do {
//            let data = try JSONEncoder().encode(path)
//            try data.write(to: savePath)
/*
 Y, por último, el método save() necesita escribir la representación codificable de nuestra ruta de navegación. Aquí es donde las cosas divergen un poco más del uso de una matriz simple, porque NavigationPath no requiere que sus tipos de datos se ajusten a Codable, solo necesita la conformidad Hashable. Como resultado, Swift no puede verificar en tiempo de compilación que hay una representación codificable válida de la ruta de navegación, por lo que tenemos que solicitarla y ver qué vuelve.

 Eso significa agregar una comprobación al inicio del método save(), que intenta recuperar la ruta de navegación codificable y se rescata inmediatamente si no recuperamos nada:
 */
            guard let representation = path.codable else { return }
/* Eso devolverá los datos listos para ser codificados en JSON, o devolverá nil si al menos un objeto en la ruta no se puede codificar.
 
 Finalmente, convertimos esa representación codificable a JSON en lugar de la matriz Int original:*/
            let data = try JSONEncoder().encode(representation)
            try data.write(to: savePath)
        } catch {
            print("Failed to save navigation data")
        }
    }
}

#Preview {
    Tutorial6()
}
