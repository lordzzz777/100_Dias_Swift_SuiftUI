//
//  Tutorial3.swift
//  AccessibilitySandbox
//
//  Created by Esteban Perez Castillejo on 3/9/24.
//

/// De forma predeterminada, SwiftUI proporciona lecturas de VoiceOver para sus controles de interfaz de usuario, y aunque estos a menudo son buenos, a veces simplemente no se ajustan a lo que necesitas. En estas situaciones podemos usar el modificador`accessibilityValue()` para separar el valor de un control de su etiqueta, pero también podemos especificar acciones de deslizamiento personalizadas usando `accessibilityAdjustableAction()`.

/// Por ejemplo, podría crear una vista que muestre algún tipo de entrada controlada por varios botones, como un paso a paso personalizado:

import SwiftUI

struct Tutorial3: View {
    @State private var value = 10
    var body: some View {
        VStack {
            Text("Value: \(value)")
            
            Button("Increment") {
                value += 1
            }
            
            Button("Decrement") {
                value -= 1
            }
        }.padding()

        /// Para solucionar esto, podemos dar instrucciones específicas de iOS sobre cómo manejar el ajuste, agrupando nuestro `VStack` usando `accessibilityElement()` y accessibilityLabel(), luego agregando los modificadores accessibilityValue() y accessibilityAdjustableAction() para responder a los deslizamientos con código personalizado.

        /// Las acciones ajustables nos entregan la dirección en la que deslizó el usuario, y podemos responder como queramos. Hay una condición: sí, podemos elegir entre deslizamientos de incremento y decremento, pero también necesitamos un caso predeterminado especial para manejar valores futuros desconocidos - Apple se ha reservado el derecho de agregar otros tipos de ajustes en el futuro.

        /// Así es como se ve en código:
        
        VStack {
            Text("Value: \(value)")

            Button("Increment") {
                value += 1
            }

            Button("Decrement") {
                value -= 1
            }
        }
        .accessibilityElement()
        .accessibilityLabel("Value")
        .accessibilityValue(String(value))
        .accessibilityAdjustableAction { direction in
            switch direction {
            case .increment:
                value += 1
            case .decrement:
                value -= 1
            default:
                print("Not handled.")
            }
        }
        
        /// Eso permite a los usuarios seleccionar todo el `VStack` para que se lea "Valor: 10", pero luego pueden deslizar hacia arriba o hacia abajo para manipular el valor y leer solo los números; es una forma mucho más natural de trabajar.
    }
}

#Preview {
    Tutorial3()
}
