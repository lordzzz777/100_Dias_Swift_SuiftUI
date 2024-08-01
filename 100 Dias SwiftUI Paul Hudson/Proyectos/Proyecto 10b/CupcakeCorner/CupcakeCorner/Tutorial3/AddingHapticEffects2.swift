//
//  AddingHapticEffects2.swift
//  CupcakeCorner
//
//  Created by Esteban Perez Castillejo on 1/8/24.
//

/// Para hápticas más avanzadas, Apple nos proporciona un marco completo llamado Core Haptics. Esta cosa se siente como un verdadero trabajo de amor por parte del equipo de Apple detrás de ella, y creo que fue una de las verdaderas joyas ocultas introducidas en iOS 13, ¡ciertamente me abancé en ella tan pronto como vi las notas de la versión!
    
///  Core Haptics nos permite crear hápticas enormemente personalizables combinando toques, vibraciones continuas, curvas de parámetros y más. No quiero profundizar demasiado aquí porque está un poco fuera de tema, pero al menos quiero darte un ejemplo para que puedas probarlo por ti mismo.

import SwiftUI
import CoreHaptics

struct AddingHapticEffects2: View {
    @State private var engine: CHHapticEngine?
    
    func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }

        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("There was an error creating the engine: \(error.localizedDescription)")
        }
    }
    
    func complexSuccess() {
        // make sure that the device supports haptics
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        var events = [CHHapticEvent]()

        // create one intense, sharp tap
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1)
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1)
        let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)
        events.append(event)

        // convert those events into a pattern and play it immediately
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play pattern: \(error.localizedDescription).")
        }
    }
    
    var body: some View {
        Button("Tap Me", action: complexSuccess)
            .onAppear(perform: prepareHaptics)
    }
}

#Preview {
    AddingHapticEffects2()
}
