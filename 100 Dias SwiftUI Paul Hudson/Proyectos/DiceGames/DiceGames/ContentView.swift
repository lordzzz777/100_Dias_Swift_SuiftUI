//
//  ContentView.swift
//  DiceGames
//
//  Created by Esteban Pérez Castillejo on 8/10/24.
//

import SwiftUI
import CoreHaptics

struct ContentView: View {
    @State var viewModel = ViewModel()
    @State private var selectedSides = 6 // Valor por defecto de 6 caras
    @State private var numberOfDice = 1 // Número de dados por defecto
    @State private var engine: CHHapticEngine? // Motor para manejar la retroalimentación háptica
    
    var body: some View {
        VStack {
            // Picker para seleccionar el número de caras del dado
            Picker("Número de caras", selection: $selectedSides) {
                Text("4 caras").tag(4)
                Text("6 caras").tag(6)
                Text("8 caras").tag(8)
                Text("10 caras").tag(10)
                Text("12 caras").tag(12)
                Text("20 caras").tag(20)
                Text("100 caras").tag(100)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            // Stepper para seleccionar el número de dados a lanzar
            Stepper("Número de dados: \(numberOfDice)", value: $numberOfDice, in: 1...10)
                .padding()
            
            // Botón para lanzar los dados con retroalimentación háptica
            Button(action: {
                viewModel.configureDice(numberOfDice, selectedSides)
               _ = viewModel.rollAllDice()
                triggerHapticFeedback() // Agregar retroalimentación háptica aquí
            }) {
                Text(viewModel.isRolling ? "Rodando..." : "Lanzar Dados")
                    .font(.title)
                    .padding()
                    .background(viewModel.isRolling ? Color.gray : Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
            .disabled(viewModel.isRolling) // Deshabilitar el botón mientras los dados están rodando
            
            // Botón para cargar los resultados previos
            Button(action: {
                viewModel.loadResultsFromJSON()
            }) {
                Text("Cargar Resultados Previos")
                    .font(.title)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
            
            // Mostrar los resultados de los dados lanzados
            Text("Resultados: \(viewModel.rollAllDice())")
                .font(.headline)
                .padding(.top)
            
            ForEach(viewModel.rollResults.indices, id: \.self) { index in
                Text("Dado \(index + 1): \(viewModel.rollResults[index])")
                    .font(.title2)
                    .opacity(viewModel.isRolling ? 0.5 : 1) // Disminuir la opacidad mientras está rodando
            }
        }
        .padding()
        .onAppear(perform: prepareHaptics) // Prepara la retroalimentación háptica cuando la vista aparezca
    }
    
    // Función para preparar el motor háptico
    func prepareHaptics() {
        do {
            engine = try CHHapticEngine() // Crear la instancia del motor háptico
            try engine?.start() // Iniciar el motor háptico
        } catch {
            print("Error al inicializar el motor háptico: \(error.localizedDescription)")
        }
    }
    
    // Función para generar retroalimentación háptica
    func triggerHapticFeedback() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
    }
//    // Función para generar retroalimentación háptica
//    func triggerHapticFeedback() {
//        // Asegurarse de que el motor háptico esté preparado
//        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
//        
//        var events = [CHHapticEvent]() // Crear un arreglo de eventos hápticos
//        
//        // Crear un evento de retroalimentación de vibración
//        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1.0)
//        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.5)
//        
//        let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)
//        
//        events.append(event)
//        
//        // Crear un patrón háptico con los eventos
//        do {
//            let pattern = try CHHapticPattern(events: events, parameters: [])
//            let player = try engine?.makePlayer(with: pattern)
//            try player?.start(atTime: 0) // Iniciar el patrón háptico inmediatamente
//        } catch {
//            print("Error al reproducir el patrón háptico: \(error.localizedDescription)")
//        }
//    }
}

#Preview {
    ContentView()
}
