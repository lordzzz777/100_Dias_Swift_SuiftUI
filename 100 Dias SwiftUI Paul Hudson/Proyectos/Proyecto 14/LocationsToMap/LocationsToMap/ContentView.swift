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
    @State private var isMap = false
    
    var body: some View {
        NavigationStack{
            VStack{
                if viewModel.isUnlocked {
                    VStack {
                        MapReader { proxy in
                            
                            Text(isMap ? "Mapa de tipo Hibridor" : "Mapa de tipo Estandar").font(.title.bold())
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
                            }.mapStyle(isMap ? .hybrid : .standard)
                            
                            // Al pulsar en el mapa almacena cordenadas
                                .onTapGesture { position in
                                    if let coordinate = proxy.convert(position, from: .local) {
                                        viewModel.addLocation(at: coordinate)
                                    }
                                }
                            
                        }
                        // Ventana model
                        .sheet(item: $viewModel.selectedPlace) { place in
                            EditView(location: place) {
                                viewModel.update(location: $0)
                            }
                        }
                        .toolbar{
                            Button("Mapa Mixto"){
                                isMap.toggle()
                            }
                        }
                    }.padding()
                }else {
                    Button("Unlock Places", action: viewModel.authenticate)
                        .padding()
                        .background(.blue)
                        .foregroundStyle(.white)
                        .clipShape(.capsule)
                }
            }
            
                .alert("Error al intentar la utenticación", isPresented: $viewModel.isMessageError, actions: {
                    Button("Ok", role: .cancel){
                        
                    }
                })
                
                .alert("La autenticaión por biometria, no es correcta, intentelo de nuevo ", isPresented: $viewModel.isMessageBiometrics, actions: {
                    Button("Ok", role: .cancel){
   
                    }
                })
        }
    }
}

#Preview {
    ContentView()
}
