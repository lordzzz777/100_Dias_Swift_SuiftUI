//
//  Tutorial 3.swift
//  LayoutAndGeometry
//
//  Created by Esteban Pérez Castillejo on 3/10/24.
//
//  Cómo crear una guía de alineación personalizada

import SwiftUI

struct Tutorial_3: View {
    var body: some View {
        
        /// SwiftUI nos proporciona guías de alineación para los diversos bordes de nuestras vistas `(.leading, .trailing, .top, etc.)` más `.center` y dos opciones de línea de base para ayudar con la alineación del texto. Sin embargo, ninguno de estos funciona bien cuando se trabaja con vistas que se dividen en vistas dispares, si tiene que hacer que dos vistas estén alineadas de la misma manera cuando están en partes completamente diferentes de su interfaz de usuario.
        
        /// Para solucionar esto, SwiftUI nos permite crear guías de alineación personalizadas y usar esas guías en las vistas de nuestra interfaz de usuario. No importa lo que venga antes o después de estas vistas; todavía se alinearán.
        
        /// Por ejemplo, aquí hay un diseño que muestra el nombre de mi cuenta de Twitter y mi foto de perfil a la izquierda, y a la derecha muestra "Nombre completo:" más "Paul Hudson" en una fuente grande:
        HStack {
            VStack {
                Text("@twostraws")
                Image(.paulHudson)
                    .resizable()
                    .frame(width: 64, height: 64)
            }
            
            VStack {
                Text("Full name:")
                Text("PAUL HUDSON")
                    .font(.largeTitle)
            }
        }
        
        
        // Ejemplo 2
        
        /// Puedes ver que he usado la dimensión de vista `.top` por defecto, y también he creado una constante estática llamada `midAccountAndName` para facilitar el uso de la alineación personalizada.
        
        /// Ahora, mencioné que usar una enumeración es preferible a una estructura, y he aquí por qué: acabamos de crear una nueva estructura llamada `MidAccountAndName`, lo que significa que podríamos (si quisiéramos) crear una instancia de esa estructura a pesar de que hacerlo no tiene sentido porque no tiene ninguna funcionalidad. Si reemplaza la estructura `MidAccountAndName` con la enumeración `MidAccountAndName`, entonces ya no puede hacer una instancia de ella - se hace más claro que esta cosa existe solo para albergar alguna funcionalidad.
        
        ///  Independientemente de si elige una enumeración o una estructura, su uso sigue siendo el mismo: establecéla como la alineación de su pila, luego use alignmentGuide() para activarla en cualquier vista que desee alinear. Esto es solo una guía: te ayuda a alinear las vistas a lo largo de una sola línea, pero no dice cómo deben alinearse. Esto significa que todavía necesita proporcionar el cierre a alignmentGuide() que posiciona las vistas a lo largo de esa guía como desee.
        
        /// Por ejemplo, podríamos actualizar nuestro código de Twitter para usar `.midAccountAndName`, y luego decirle a la cuenta y al nombre que usen su posición central para la guía. Para ser claros, eso significa "alinear estas dos vistas para que sus centros estén ambos en la guía .midAccountAndName".
        
        /// Así es como se ve eso en código:
        
        HStack(alignment: .midAccountAndName) {
            VStack {
                Text("@twostraws")
                    .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center] }
                Image(.paulHudson)
                    .resizable()
                    .frame(width: 64, height: 64)
            }

            VStack {
                Text("Full name:")
                Text("PAUL HUDSON")
                    .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center] }
                    .font(.largeTitle)
            }
        }
    }
}

/// Si quieres que "@twostraws" y "Paul Hudson" estén alineados verticalmente, lo pasarás mal ahora mismo. La pila `horizontal` contiene dos pilas verticales en su interior, por lo que no hay una forma incorporada de obtener la alineación que desea: cosas como `HStack(alignment: .top)` simplemente no se acercarán.

/// Para arreglar esto, necesitamos definir una guía de diseño personalizada. Esta debe ser una extensión en `VerticalAlignment u HorizontalAlignment`, y ser un tipo personalizado que se ajuste al protocolo `AlignmentID`.

/// Cuando digo "tipo personalizado" podrías estar pensando en una estructura, pero en realidad es una buena idea implementar esto como una enumeración en su lugar, como explicaré en breve. El protocolo `AlignmentID` solo tiene un requisito, que es que el tipo conforme debe proporcionar un método estático `defaultValue(in:)` que acepte un objeto `ViewDimensions` y devuelva un CGFloat que especifique cómo debe alinearse una vista si no tiene un modificador alignmentGuide(). Se le dará el objeto `ViewDimensions` existente para la vista, por lo que puede elegir uno de esos para su valor predeterminado o usar un valor codificado.

/// Escribamos el código para que puedas ver cómo se ve:

extension VerticalAlignment {
    struct MidAccountAndName: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.top]
        }
    }

    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}


#Preview {
    Tutorial_3()
}
