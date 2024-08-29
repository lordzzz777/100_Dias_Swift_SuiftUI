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
    
    @State private var viewModel = ViewModel()
    
    var body: some View {
        if viewModel.isUnlocked {
            VStack {
                MapReader { proxy in
                    
                    Map(initialPosition: startPosition){
                        ForEach(viewModel.locations){ location in
                            // Crea marca de puntuacón personalizada
                            Annotation(location.name, coordinate: location.coordinate) {
                                Image(systemName:  "scope")
                                    .resizable()
                                    .foregroundStyle(.red)
                                    .frame(width: 60, height: 50)
                                    .background(.white)
                                    .clipShape(.circle)
                                    .onLongPressGesture {
                                        viewModel.selectedPlace = location
                                    }
                            }
                        }
                    }
                    // Al pulsar en el mapa almacena cordenadas
                    .onTapGesture { position in
                        if let coordinate = proxy.convert(position, from: .local) {
                            viewModel.addLocation(at: coordinate)
                        }
                    }
                    
                    // Ventana model
                    .sheet(item: $viewModel.selectedPlace) { place in
                        EditView(location: place) {
                            viewModel.update(location: $0)
                        }
                    }
                }
            }
        }else {
            Button("Unlock Places", action: viewModel.authenticate)
                .padding()
                .background(.blue)
                .foregroundStyle(.white)
                .clipShape(.capsule)
        }
        
    }
}

#Preview {
    ContentView()
}
