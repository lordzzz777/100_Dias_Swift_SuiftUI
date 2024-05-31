//
//  ContentView.swift
//  BetterRest
//
//  Created by Esteban Perez Castillejo on 29/5/24.
//
//      Reto Día 28:
//      -----------
//
// 1 .- Reemplace cada VStack en nuestro formulario con una sección,
//      donde la vista de texto es el título de la sección.
//      ¿Prefieres este diseño o el diseño de VStack? Es tu aplicación,
//      ¡tú eliges!
//
// 2 .- Reemplace el paso a paso "Número de tazas" por un selector que
//      muestre el mismo rango de valores.
//
// 3 .- Cambie la interfaz de usuario para que siempre muestre su hora
//      de acostarse recomendada usando una fuente bonita y grande.
//      Deberías poder eliminar el botón "Calcular" por completo.

import CoreML
import SwiftUI

struct ContentView: View {
    
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
                Section("¿Cuándo quieres despertarte?") {
                    DatePicker("Por favor, introduzca una hora", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                
                // 2º componente (sección, catidas de horas)
                Section("¿Cuanto quieres dormir?") {
                    Stepper("\(sleepAmount.formatted()) horas", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                
                // 3º componente (sección, de cuanto cafe toma)
                Section("¿Cuanto cafe diario tomas?") {
                    //Stepper("^[\(coffeeAmount) cup](inflect: true)", value: $coffeeAmount, in: 1...20)
                    Picker("^[\(coffeeAmount) cup](inflect: true)", selection: $coffeeAmount, content: {
                        ForEach(1..<20){ cup in
                            Text(cup.description)
                        }
                    })
                }
                
                Section ("Hora de Acostarse recomendada "){
                    Text("\(Image(systemName: "person.crop.circle.badge.moon")) \(alertTitle) \(alertMessage) ").font(.system(size: 16)).bold()
                }
            }
            
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
                Button(action: {
                    calculateBedtime()
                }, label: {
                    Image(systemName: "person.crop.circle.badge.clock")
                    Text("Calculate")
                    
                })
            }
            
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("Ok"){}
            } message: {
                Text("\(alertTitle) \(alertMessage)")
            }
            .navigationTitle("BetterBest")
            //                 .toolbar {
            //                     Button("Calculate", action: calculateBedtime)
            //                 }
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
    ContentView()
}
