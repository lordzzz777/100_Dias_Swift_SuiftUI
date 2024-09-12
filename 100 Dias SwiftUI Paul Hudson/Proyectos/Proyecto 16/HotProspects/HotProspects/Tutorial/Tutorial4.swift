//
//  Tutorial4.swift
//  HotProspects
//
//  Created by Esteban Perez Castillejo on 12/9/24.
//

import SwiftUI

struct Tutorial4: View {
    /// Eso representa el personaje alienígena sobre un fondo negro para que sea más fácil de ver, y debido a que es redimensionable, SwiftUI lo estirará para llenar todo el espacio disponible.
    
   /// Eche un vistazo de cerca a los bordes de los colores: se ven irregulares, pero también borrosos. La parte irregular proviene de la imagen original porque solo tiene un tamaño de 66x92 píxeles, pero la parte borrosa es donde SwiftUI está tratando de mezclar los píxeles a medida que se estiran para que el estiramiento sea menos obvio.

   ///  A menudo, esta mezcla funciona muy bien, pero aquí tiene dificultades porque la imagen de origen es pequeña (y, por lo tanto, necesita mucha mezcla para mostrarse al tamaño que queremos), y también porque la imagen tiene muchos colores sólidos, por lo que los píxeles mezclados se destacan de forma bastante obvia.

   /// Para situaciones como esta, SwiftUI nos da el modificador `nterpolation()` que nos permite controlar cómo se aplica la mezcla de píxeles. Hay múltiples niveles para esto, pero siendo realistas solo nos importa uno: `.none. Esto apaga por completo la interpolación de imágenes, por lo que en lugar de mezclar píxeles, simplemente se escalan con bordes afilados.

   /// Así que, modifica tu imagen a esta:
    var body: some View {
        Image(.example)
            .interpolation(.none)
            .resizable()
            .scaledToFit()
            .background(.black)
    }
    /// Ahora verás que el personaje alienígena conserva su aspecto pixelado, que no solo es particularmente popular en los juegos retro, sino que también es importante para el arte lineal que se vería mal cuando está borroso.
}

#Preview {
    Tutorial4()
}
