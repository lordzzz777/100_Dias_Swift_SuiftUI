//
//  DetailView.swift
//  Projects_13_15
//
//  Created by Esteban Perez Castillejo on 9/9/24.
//

import SwiftUI
import SwiftData
import MapKit
import CoreLocation

struct DetailView: View {
    @Bindable var model: ModelData
    
    // Para que la vista se actualice cuando cambie la ubicación
    @State private var userLocation: CLLocationCoordinate2D?
    
    let locationFetcher = LocationFetcher()
    
    // Posición inicial del mapa, centrado en un punto predeterminado
    let startPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 38, longitude: -4),
            span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
        )
    )

    var body: some View {
        NavigationStack{
            VStack{
                MapReader{ proxy in
                    VStack{
                        Text(model.title).font(.title.bold())
                        Map(initialPosition: startPosition){
                            if let location = locationFetcher.lastKnownLocation {
                                Annotation(model.title , coordinate: location) {
                                    if let imageData = model.photo, let uiImage = UIImage(data: imageData){
                                        Image(uiImage: uiImage)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 50, height: 50)
                                            .clipShape(Circle())
                                            .shadow(radius: 10)
                                    }
                                }
                            }
                            
                            
                        }.frame(width: 350, height: 350)
                            .clipShape(.rect(cornerRadius: 7))
                            .padding()
                    }
            }

                if let imageData = model.photo, let uiImage = UIImage(data: imageData){
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 350, height: 350)
                        .clipShape(.rect(cornerRadius: 9))
                        .shadow(radius: 10)
                }
                Spacer()
            }
            .toolbar{
                Button("Start Tracking Location") {
                    locationFetcher.start()
                }
                
                Button("Read Location") {
                    if let location = locationFetcher.lastKnownLocation {
                      
                        print("Your location is \(location)")
                    } else {
                        print("Your location is unknown")
                    }
                }
            }
        }
    }
}


#Preview {
    
    do{
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: ModelData.self, configurations: config)
        let modelData = ModelData(title: "prueba", photo: Data())
        return DetailView(model: modelData)
            .modelContainer(container)
    }catch {
        return Text("Fallo al cerrar el contexto: \(error.localizedDescription)")
    }
}
