//
//  ContentView.swift
//  LocationsToMap
//
//  Created by Esteban Perez Castillejo on 27/8/24.
//

import SwiftUI
import MapKit

struct ContentView: View {
    // Contate que agrega una posición inial para el mapa
    let startPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 38, longitude: -4),
            span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
        )
    )
    
    @State private var locations = [Location]()
    @State private var selectedPlace: Location?
    
    var body: some View {
        VStack {
            MapReader { proxy in

                Map(initialPosition: startPosition){
                    ForEach(locations){ location in
                        // Crea marca de puntuacón personalizada
                        Annotation(location.name, coordinate: location.coordinate) {
                            Image( "LocationRaul")
                                .resizable()
                                .foregroundStyle(.red)
                                .frame(width: 60, height: 50)
                                .background(.white)
                                .clipShape(.circle)
                                .onLongPressGesture {
                                    selectedPlace = location
                                }
                        }
                    }
                }
                // Al pulsar en el mapa almacena cordenadas
                    .onTapGesture { position in
                        
                        if let coordinate = proxy.convert(position, from: .local) {
                            let newLocation = Location(id: UUID(), name: "New location", description: "", latitude: coordinate.latitude, longitude: coordinate.longitude)
                            locations.append(newLocation)
                        }
                    }
                
                // Ventana model
                    .sheet(item: $selectedPlace) { place in
                        EditView(location: place) { newLocation in
                            if let index = locations.firstIndex(of: place) {
                                locations[index] = newLocation
                            }
                        }
                    }
            }
        }
        
    }
}

#Preview {
    ContentView()
}
