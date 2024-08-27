//
//  Location.swift
//  LocationsToMap
//
//  Created by Esteban Perez Castillejo on 27/8/24.
//

import Foundation
import MapKit

/// Donde las cosas se ponen interesantes es cómo colocamos las ubicaciones en el mapa. Hemos vinculado la ubicación
/// del mapa a una propiedad en ContentView, pero ahora necesitamos enviar una matriz de ubicaciones que queremos mostrar.

/// Esto requiere algunos pasos, comenzando con una definición básica del tipo de ubicaciones que estamos
/// creando en nuestra aplicación. Esto debe ajustarse a algunos protocolos:

/// * `Identificable`, para que podamos crear muchos marcadores de ubicación en nuestro mapa.

/// * `Codificable`, para que podamos cargar y guardar los datos del mapa fácilmente.

/// * `Equiparable`, por lo que podemos encontrar una ubicación en particular en una serie de ubicaciones.

/// * En términos de los datos que contendrá, le daremos a cada ubicación un nombre y una descripción, además de una latitud y longitud.

/// También necesitaremos agregar un identificador único para que SwiftUI esté feliz de crearlos a partir de datos dinámicos.

struct Location: Codable, Equatable, Identifiable {

    var id: UUID
    var name: String
    var description: String
    var latitude: Double
    var longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    #if DEBUG
    static let example = Location(id: UUID(),
                                  name: "Buckingham Palace",
                                  description: "Lit by over 40,000 lightbulbs.",
                                  latitude: 51.501,
                                  longitude: -0.141)
    #endif
    
    static func ==(lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
