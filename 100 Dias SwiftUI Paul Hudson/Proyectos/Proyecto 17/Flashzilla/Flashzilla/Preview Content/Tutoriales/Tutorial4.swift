//
//  Tutorial4.swift
//  Flashzilla
//
//  Created by Esteban Pérez Castillejo on 23/9/24.
//
//  Cómo recibir una notificación cuando su aplicación SwiftUI se mueva a segundo plano

/// SwiftUI puede detectar cuándo su aplicación se mueve al fondo (es decir, cuando el usuario regresa a la pantalla de inicio) y cuándo vuelve al primer plano, y si junta esos dos, nos permite asegurarnos de que nuestra aplicación haga una pausa y reanude el trabajo dependiendo de si el usuario puede verla ahora mismo o no.

/// Esto se hace siguiendo tres pasos:
/// 1. - Agregar una nueva propiedad para ver un valor de entorno llamado `scenePhase`.
/// 2. - Usando `onChange()` para vigilar el cambio de fase de la escena.
/// 3. - Respondiendo a la nueva fase de la escena de alguna manera.

/// Puede que te preguntes por qué se llama fase de escena en lugar de algo que tiene que ver con el estado actual de tu aplicación, pero recuerda que en el iPad el usuario puede ejecutar varias instancias de tu aplicación al mismo tiempo; pueden tener varias ventanas, conocidas como escenas, cada una en un estado diferente.

/// Para ver las diversas fases de la escena en acción, pruebe este código:

import SwiftUI

struct Tutorial4: View {
    @Environment(\.scenePhase) var scenePhase

    var body: some View {
        Text("Hello, world!")
            .onChange(of: scenePhase) { oldPhase, newPhase in
                if newPhase == .active {
                    print("Active")
                } else if newPhase == .inactive {
                    print("Inactive")
                } else if newPhase == .background {
                    print("Background")
                }
            }
    }
    
    /// Cuando vuelvas a ejecutar eso, intenta ir a la pantalla de inicio de tu simulador, bloquear el dispositivo virtual y otras actividades comunes para ver cómo cambia la fase de escena.
    
    /// Como puedes ver, hay tres fases de la escena que debemos preocuparnos:
    /// Las escenas activas se están ejecutando en este momento, lo que en iOS significa que son visibles para el usuario. En macOS, la ventana de una aplicación puede estar totalmente oculta por la ventana de otra aplicación, pero está bien, todavía se considera activa.

    /// Las escenas inactivas se están ejecutando y pueden ser visibles para el usuario, pero el usuario no puede acceder a ellas. Por ejemplo, si está deslizando hacia abajo para revelar parcialmente el centro de control, entonces la aplicación debajo se considera inactiva.

    /// Las escenas de fondo no son visibles para el usuario, lo que en iOS significa que podrían terminarse en algún momento en el futuro.
}

#Preview {
    Tutorial4()
}
