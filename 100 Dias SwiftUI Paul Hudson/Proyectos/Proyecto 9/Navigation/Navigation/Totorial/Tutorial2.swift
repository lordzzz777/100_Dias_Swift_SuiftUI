//
//  Tutorial2.swift
//  Navigation
//
//  Created by Esteban Perez Castillejo on 22/7/24.
//

import SwiftUI

struct Tutorial2: View {
    var body: some View {
        NavigationStack {
            /// En primer lugar, podríamos hacer una lista de 100 números, con cada uno adjunto a un enlace de navegación como su valor de presentación; le estamos diciendo a SwiftUI que queremos navegar a un número. Así es como se ve eso:
            
            List(0..<100) { i in
                NavigationLink("Select \(i)", value: i)
            }
            
            /// Ahora, ese código no es suficiente. Sí, le hemos dicho a SwiftUI que queremos navegar a 0 cuando se toque "Seleccionar 0", pero no hemos dicho cómo mostrar esos datos. ¿Debería ser algo de texto, un VStack con algunas imágenes, una vista SwiftUI personalizada o algo completamente más?
            
          ///  Aquí es donde entra en juego el modificador navigationDestination(): podemos decirle "cuando se te pide que navegues a un entero, esto es lo que debes hacer..."

            .navigationDestination(for: Int.self){ selection in
                Text("You selected \(selection)")
            }
        }
    }
}

#Preview {
    Tutorial2()
}
