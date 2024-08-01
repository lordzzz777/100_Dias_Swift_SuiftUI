//
//  ImageURL.swift
//  CupcakeCorner
//
//  Created by Esteban Perez Castillejo on 31/7/24.
//

import SwiftUI

struct ImageURL: View {
    
    var body: some View {
        
        // imagen generada apartir de una url
        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"), scale: 3)// cargar imagen a escala 3X
        // precisa el tamaño de la imagen
        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")){ image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            Color.red
        }
        .frame(width: 200, height: 200)
        //  hay una tercera forma de crear AsyncImage que nos dice si la imagen se ha cargado, si se ha recibido un error o si aún no ha terminado. Esto es particularmente útil en los momentos en los que desea mostrar una vista dedicada cuando la descarga falla, si la URL no existe, o si el usuario estaba desconectado, etc.
        
        AsyncImage(url: URL(string: "https://hws.dev/img/bad.png")) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
            } else if phase.error != nil {
                Text("There was an error loading the image.")
            } else {
                ProgressView()
            }
        }
        .frame(width: 200, height: 200)
    }
}

#Preview {
    ImageURL()
}
