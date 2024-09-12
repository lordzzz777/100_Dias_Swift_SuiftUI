//
//  Tutorial3.swift
//  HotProspects
//
//  Created by Esteban Perez Castillejo on 12/9/24.
//

import SwiftUI

struct Tutorial3: View {
    @State private var ouput = ""
    
    var body: some View {
        Text(ouput)
            .task {
                await fetchReadings()
            }
    }
    
    func fetchReading() async {
        do{
            let url = URL(string: "https://hws.dev/readings.json")!
            let (data, _) = try await  URLSession.shared.data(from: url)
            let readings = try JSONDecoder().decode([Double].self, from: data)
            ouput = "From \(readings.count) readings"
        }catch{
            print("La descarga es erronea")
        }
    }
    
    /// Ese código funciona bien, pero no nos da mucha flexibilidad, ¿qué pasa si queremos esconder el trabajo en algún lugar y hacer otra cosa mientras se está ejecutando? ¿Qué pasa si queremos leer su resultado en algún momento en el futuro, tal vez manejando cualquier error en otro lugar completamente diferente? ¿O qué pasa si solo queremos cancelar el trabajo porque ya no es necesario?
    
   /// Bueno, podemos obtener todo eso usando `Result`, y en realidad está disponible a través de una`API` que has conocido anteriormente: `Task. Podríamos reescribir el código anterior a esto:
    func fetchReadings() async {
        let fetchTask = Task {
            let url = URL(string: "https://hws.dev/readings.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let readings = try JSONDecoder().decode([Double].self, from: data)
            return "Found \(readings.count) readings"
        }
        let result = await fetchTask.result
        
//        do{
//            ouput = try result.get()
//        }catch{
//            ouput = "Error \(error.localizedDescription)"
//        }
        
        switch result {
        case .success(let str):
            ouput = str
        case .failure(let error):
            ouput = " Error: \(error.localizedDescription)"
        }
    }

}

#Preview {
    Tutorial3()
}
