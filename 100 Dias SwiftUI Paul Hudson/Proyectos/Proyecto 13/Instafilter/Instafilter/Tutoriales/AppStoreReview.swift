//
//  AppStoreReview.swift
//  Instafilter
//
//  Created by Esteban Perez Castillejo on 19/8/24.
//

import SwiftUI
import StoreKit

struct AppStoreReview: View {
    /// SwiftUI proporciona una clave de entorno especial llamada `.requestReview`, que nos permite pedirle al usuario que deje una reseña para nuestra aplicación en la App Store. Apple se encarga de mostrar toda la interfaz de usuario, asegurándose de que no se muestre si el usuario ya ha dejado una reseña, y también de limitar la frecuencia con la que se puede mostrar la solicitud, solo tenemos que hacer una solicitud cuando estemos listos.
    
    @Environment(\.requestReview) var requestReview
    
    var body: some View {
        
        /// Y en tercer lugar, debes solicitar una revisión cuando estés listo. Cuando recién estás empezando, podrías pensar que adjuntar la revisión a una pulsación de un botón es una buena idea, como esta:
        Button("Leave a review") {
            requestReview()
        }
        
        /// Sin embargo, eso está lejos de ser ideal, sobre todo porque solo estamos solicitando que se muestre un aviso de revisión: el usuario podría haber desactivado estas alertas en todo el sistema, o que ya podría haber alcanzado el número máximo de solicitudes de revisión permitidas, en cuyo caso su botón no haría nada.
        
       /// En su lugar, es mejor llamar a `requestReview()` automáticamente cuando creas que es el momento adecuado. Un buen punto de partida es cuando el usuario ha realizado una tarea importante varias veces, porque de esa manera está claro que se ha dado cuenta del beneficio de su aplicación.
    }
}

#Preview {
    AppStoreReview()
}
