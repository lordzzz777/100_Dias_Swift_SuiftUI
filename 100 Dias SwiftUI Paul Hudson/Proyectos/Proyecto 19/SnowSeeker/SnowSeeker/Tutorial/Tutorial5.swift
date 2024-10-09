//
//  Tutorial5.swift
//  SnowSeeker
//
//  Created by Esteban Pérez Castillejo on 9/10/24.
//
//  Compartir objetos @Observable a través del entorno de SwiftUI

import SwiftUI
import Observation

/// La macro @Observable de Swift combinada con @State facilita la creación y el uso de datos en nuestras aplicaciones, y anteriormente hemos visto cómo pasar valores entre diferentes vistas. Sin embargo, a veces necesitas que el mismo objeto se comparta en muchos lugares de tu aplicación, y para eso necesitamos recurrir al entorno de SwiftUI.

/// Para ver cómo funciona esto, comencemos con algún código que ya deberías conocer. Esto crea una pequeña clase de jugador que puede ser observada por SwiftUI:
struct Tutorial5: View {
    /// Eso espera que se le dé un valor de jugador, por lo que podríamos escribir código como este:
   // @State private var player = Player()
    
    var body: some View {
        
        /// Todo esto es código antiguo: muestra pasar un valor a una subvista directamente, por lo que se puede usar allí.
        
        /// Por lo general, sin embargo, tenemos necesidades más complejas: ¿y si ese objeto necesita ser compartido en muchos lugares? ¿O qué pasa si la vista A necesita pasarla para ser la vista B, que necesita pasar la vista C, que necesita pasar la vista D? Puedes ver fácilmente cómo eso sería bastante tedioso de codificar.

        /// SwiftUI tiene una mejor solución para estos problemas: podemos colocar nuestro objeto en el entorno y luego usar el envoltorio de propiedades @Environment para leerlo de nuevo.

        /// Esto requiere dos pequeños cambios en nuestro código. Primero, ya no pasamos un valor directamente a HighScoreView, y en su lugar usamos el modificador environment() para colocar nuestro objeto en el entorno:
        
        @Environment(Player.self) var player
        
        VStack {
            Text("Welcome!")
           // HighScoreView(player: player)
        }.environment(player)
    }
}

@Observable
class Player {
    @MainActor
    var name = "Anonymous"
    @MainActor
    var highScore = 0
}

/// Luego podemos mostrar su puntuación más alta en una vista pequeña como esta:
struct HighScoreView: View {
    /// Al igual que con otros tipos de estado observado, HighScoreView se recargará automáticamente cuando sus propiedades cambien. Sin embargo, tenga cuidado: su aplicación se bloqueará si dice que un objeto de entorno estará en el entorno y no lo está.
    
    /// Aunque esto funciona bien en su mayoría, hay un lugar donde hay un problema y es casi seguro que lo golpearás: cuando intentes usar un valor @Environment como enlace.

    /// Nota: Si estás leyendo esto después de que se lanzara iOS 18, espero sinceramente que Apple haya resuelto este problema, pero ahora mismo estoy usando iOS 17 y es un problema.

    /// Puedes ver el problema con un código como este:
    var player: Player

    var body: some View {
        Text("Your high score: \(player.highScore)")
    }
}
#Preview {
    Tutorial5()
       
    
}
