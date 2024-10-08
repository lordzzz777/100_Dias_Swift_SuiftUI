//
//  model.swift
//  DiceGames
//
//  Created by Esteban Pérez Castillejo on 8/10/24.
//

import Foundation
import Observation

@Observable
class ViewModel{
    var dice: [Model] = [] // Arreglo de los dadoas
    var rollResults: [Int] = [] // Resultados de los dados lanzados
    var isRolling: Bool = false // Estado para saber si los dados están "rodando"
    
    // Funcion para tirar los dados
    func rollAllDice() -> [Int] {
        return dice.compactMap{$0.sides.randomElement()}
        
    }
    
    // funcion para personalizar loas dados
    func configureDice(_ count: Int, _ sides: Int){
        dice = (0..<count).compactMap{ _ in Model(numberOfSides: sides)}
    }
    
    // Guardar los resultados en JSON
      func saveResultsToJSON() {
          let encoder = JSONEncoder()
          encoder.outputFormatting = .prettyPrinted // Para que el JSON sea legible
          do {
              let data = try encoder.encode(rollResults)
              let url = getDocumentsDirectory().appendingPathComponent("diceResults.json")
              try data.write(to: url)
              print("Resultados guardados en: \(url)")
          } catch {
              print("Error al guardar los resultados en JSON: \(error)")
          }
      }
    
    // Cargar los resultados desde JSON
    func loadResultsFromJSON() {
        let url = getDocumentsDirectory().appendingPathComponent("diceResults.json")
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            rollResults = try decoder.decode([Int].self, from: data)
            print("Resultados cargados: \(rollResults)")
        } catch {
            print("Error al cargar los resultados desde JSON: \(error)")
        }
    }
    
    // Función para lanzar los dados con efecto de rodado
    func rollAllDiceWithEffect(completion: @escaping () -> Void) {
        isRolling = true
        var temporaryResults = [Int](repeating: 0, count: dice.count)
        rollResults = temporaryResults
        
        var rollCounter = 0
        let maxRolls = 10 // Número de veces que los dados cambian antes de llegar al resultado final
        let rollInterval = 0.1 // Intervalo de tiempo entre cambios de valor
        
        // Crear un temporizador que simule los cambios en los valores de los dados
        Timer.scheduledTimer(withTimeInterval: rollInterval, repeats: true) { timer in
            rollCounter += 1
            
            // Cambiar temporalmente los resultados de los dados
            temporaryResults = self.dice.compactMap { $0.sides.randomElement() }
            self.rollResults = temporaryResults
            
            // Detener el temporizador después de un número de cambios y establecer el valor final
            if rollCounter >= maxRolls {
                timer.invalidate()
                self.rollResults = self.dice.compactMap { $0.sides.randomElement() }
                self.isRolling = false
                completion() // Llamamos a la finalización para acciones posteriores
            }
        }
    }
    
    // Obtener el directorio de documentos
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
