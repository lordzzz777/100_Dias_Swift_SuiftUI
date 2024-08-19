//
//  Share.swift
//  Instafilter
//
//  Created by Esteban Perez Castillejo on 19/8/24.
//

import SwiftUI

struct Share: View {
    let example = Image(.example)
    
    var body: some View {
        /// Eso va a hacer un botón que diga "Compartir" con un icono adjunto, y al presionarlo aparecerá la hoja de acciones de iOS. Si estás en el simulador, solo verás unas pocas cosas allí como muestras, y algunas pueden que ni siquiera funcionen, pero si usas un dispositivo real, verás que puedes compartir esa URL muy bien.
        ShareLink(item: URL(string: "https://www.hackingwithswift.com")!)
            .padding()
        /// La forma en que se utiliza esa información depende de la que los usuarios compartan la aplicación: la URL siempre se adjuntará, porque eso es lo más importante, pero algunas aplicaciones utilizarán el asunto, otras el mensaje y otras usarán ambas.
        ShareLink(item: URL(string: "https://www.hackingwithswift.com")!, subject: Text("Learn Swift here"), message: Text("Check out the 100 Days of SwiftUI!"))
            .padding()
        /// En segundo lugar, puedes personalizar el botón en sí proporcionando la etiqueta que quieras:
        ShareLink(item: URL(string: "https://www.hackingwithswift.com")!) {
            Label("Spread the word about Swift", systemImage: "swift")
        }
        .padding()
        /// Y en tercer lugar, puede proporcionar una vista previa para adjuntar, lo cual es importante cuando está compartiendo algo más complejo: es posible compartir datos completamente personalizados aquí, por lo que la vista previa es útil para dar al destinatario una idea de lo que hay dentro.
        
        /// Molesto, esto es necesario incluso para los datos que son su propia vista previa, como una imagen. Para evitar que su código sea repetitivo, sugeriría asignar la imagen a una constante local y luego usarla:
       
        ShareLink(item: example, preview: SharePreview("Singapore Airport", image: example)) {
            Label("Click to share", systemImage: "airplane")
        }
        .padding()
    }
}

#Preview {
    Share()
}
