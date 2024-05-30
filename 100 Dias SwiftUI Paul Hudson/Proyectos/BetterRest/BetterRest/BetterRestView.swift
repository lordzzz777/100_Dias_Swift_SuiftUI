//
//  BetterRestView.swift
//  BetterRest
//
//  Created by Esteban Perez Castillejo on 30/5/24.
//

import CoreML
import SwiftUI

struct BetterRestView: View {
    
   // estas tres propiedades gurarda la información de nuestros controles
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    // pripiedades de la alerta
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    // Propiedad calculada
   static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    var body: some View {
        NavigationStack {
            Form {
                
                // 1º componenete (sección, hora de despertar)
                VStack(alignment: .leading,spacing: 5) {
                    Text("¿Cuándo quieres despertarte?")
                        .font(.headline)
                    
                    DatePicker("Por favor, introduzca una hora", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                
                // 2º componente (sección, catidas de horas)
                VStack(alignment: .leading,spacing: 5) {
                    Text("¿Cuanto quieres dormir?")
                        .font(.headline)
                    
                    Stepper("\(sleepAmount.formatted()) horas", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                
                // 3º componente (sección, de cuanto cafe toma)
                VStack(alignment: .leading,spacing: 5) {
                    Text("¿Cuanto cafe diario tomas?")
                        .font(.headline)
                    
                    Stepper("^[\(coffeeAmount) cup](inflect: true)", value: $coffeeAmount, in: 1...20)
                }
           
            }
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("Ok"){}
            } message: {
                Text(alertTitle)
            }
            .navigationTitle("BetterBest")
            .toolbar {
                Button("Calculate", action: calculateBedtime)
            }
        }
    }
    
    // Función que utiliza el modelo de predición
    func calculateBedtime(){
        do{
            let cofi = MLModelConfiguration()
            let model = try SleepCalculator(configuration: cofi)
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            let sleepTime = wakeUp - prediction.actualSleep
            
            alertTitle = "Tu hora ideal para dormir es..."
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        }catch{
            alertTitle = "Error"
            alertMessage = "Lo siento, hubo un problema al calcular tu hora de dormir."
        }
        
        showingAlert = true
    }
}

#Preview {
    BetterRestView()
}
