//
//  Turoeial5.swift
//  Flashzilla
//
//  Created by Esteban Pérez Castillejo on 23/9/24.
//
//  Apoyando necesidades específicas de accesibilidad con SwiftUI

/// SwiftUI nos da una serie de propiedades de entorno que describen la configuración de accesibilidad personalizada del usuario, y vale la pena tomarse el tiempo para leer y respetar esa configuración.

/// De vuelta en el proyecto 15, miramos las etiquetas y sugerencias de accesibilidad, rasgos, grupos y más, pero estos ajustes son diferentes porque se proporcionan a través del entorno. Esto significa que SwiftUI los monitorea automáticamente en casta de cambios e invocará la propiedad de nuestro cuerpo cada vez que uno de ellos cambie.

/// Por ejemplo, una de las opciones de accesibilidad es "Diferenciar sin color", que es útil para 1 de cada 12 hombres que tienen daltonismo. Cuando esta configuración está habilitada, las aplicaciones deben intentar que su interfaz de usuario sea más clara utilizando formas, iconos y texturas en lugar de colores.

/// Para usar esto, simplemente agregue una propiedad de entorno como esta:
import SwiftUI

struct Turoeial5: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    
    @State private var scale = 1.0
    
    var body: some View {
        HStack {
            if differentiateWithoutColor {
                Image(systemName: "checkmark.circle")
            }
            
            Text("Success")
        }
        .padding()
        .background(differentiateWithoutColor ? .black : .green)
        .foregroundStyle(.white)
        .clipShape(.capsule)
        
        /// Puedes probarlo en el simulador yendo a la aplicación Configuración y seleccionando Accesibilidad > Pantalla y tamaño de texto > Diferenciar sin color.
        /// Otra opción común es Reducir movimiento, que de nuevo está disponible en el simulador en Accesibilidad > Movimiento > Reducir movimiento. Cuando esto está habilitado, las aplicaciones deben limitar la cantidad de animación que causa movimiento en la pantalla. Por ejemplo, el conmutador de aplicaciones de iOS hace que las vistas se desvanezcan en lugar de escalar hacia arriba y hacia abajo.
        
        /// Con SwiftUI, esto significa que debemos restringir el uso de withAnimation() cuando implica movimiento, así:
        
        Button("Hello, World!") {
            if reduceMotion {
                scale *= 1.5
            } else {
                withAnimation {
                    scale *= 1.5
                }
            }
            
        }
        .scaleEffect(scale)
        
        /// Por lo tanto, cuando Reduce Motion Enabled es verdadero, el código de cierre que se pasa se ejecuta inmediatamente, de lo contrario se pasa usando withAnimation(). Todo el asunto de los lanzamientos/relanzamientos es Swift más avanzado, pero es una copia directa de la firma de la función para withAnimation() para que los dos se puedan usar indistintamente.
        
        /// Úsalo así:
        
        Button("Hello, World!") {
            withOptionalAnimation {
                scale *= 1.5
            }
            
        }
        .scaleEffect(scale)
        
        /// Usando este enfoque, no necesita repetir su código de animación cada vez.
        
        /// Una última opción que debería considerar apoyar es Reducir Transparencia, y cuando eso está habilitado, las aplicaciones deben reducir la cantidad de desenfoque y translucidez utilizada en sus diseños para asegurarse doblemente de que todo esté claro.
        
        /// Por ejemplo, este código utiliza un fondo negro sólido cuando se habilita Reducir transparencia, de lo contrario se utiliza un 50 % de transparencia:
        
        Text("Hello, World!")
            .padding()
            .background(reduceTransparency ? .black : .black.opacity(0.5))
            .foregroundStyle(.white)
            .clipShape(.capsule)
    }
    
    /// No sé tú, pero me parece bastante molesto usarlo. Afortunadamente, podemos agregar una pequeña función de envoltura alrededor de withAnimation() que utiliza los datos de UIAccessibility de UIKit directamente, lo que nos permite omitir la animación automáticamente:
    func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
        if UIAccessibility.isReduceMotionEnabled {
            return try body()
        } else {
            return try withAnimation(animation, body)
        }
    }
    
}

#Preview {
    Turoeial5()
}
