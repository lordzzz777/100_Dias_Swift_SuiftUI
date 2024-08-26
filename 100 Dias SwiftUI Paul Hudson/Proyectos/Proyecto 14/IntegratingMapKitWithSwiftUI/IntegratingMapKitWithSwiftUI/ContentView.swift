//
//  ContentView.swift
//  IntegratingMapKitWithSwiftUI
//
//  Created by Esteban Perez Castillejo on 25/8/24.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    // Contante que almacena la posición de londres
    let positionLomdon = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275),
            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        )
    )
    
    /// definir ubicaciones para coplocar anotaciones
    let locations = [
        Location(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
        Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
    ]
    
    /// Ese valor es solo una posición inicial. Si quieres cambiar la posición con el tiempo, tendrás que marcarla como `@State` y luego pasarla como una encuadernación.
   /// Así que, primero haz que use `@State`:
    
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275),
            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        )
    )
    @State private var namePlace: String = "Londres"
    var body: some View {
        NavigationStack{
          ScrollView {
              /// El tercer paso es la parte importante: podemos alimentar esa variedad de ubicaciones en la vista del mapa como su contenido. SwiftUI nos proporciona un par de tipos de contenido diferentes, pero uno simple se llama Marker: un globo con un título y coordenadas de latitud/longitud adjuntas.
              
             ///  Por ejemplo, podríamos colocar marcadores en ambas ubicaciones de la siguiente manera:
              
              Map {
                  ForEach(locations) { location in
                      Marker(location.name, coordinate: location.coordinate)
                      // marcador personalizado, con etiqueta
                      Annotation(location.name, coordinate: location.coordinate) {
                          Text(location.name)
                              .font(.headline)
                              .padding()
                              .background(.blue)
                              .foregroundStyle(.white)
                              .clipShape(.capsule)
                      }
                      .annotationTitles(.hidden)
                  }
              }.frame(width: 350, height: 300)
              
              /// Y, por último, puedes manejar los toques en el mapa usando onTapGesture(). Esto nos dice dónde en el mapa tocó el usuario, pero lo hace en las coordenadas de la pantalla, por ejemplo, 50 puntos desde la parte superior y 100 puntos desde la izquierda.
              
            ///  Para obtener una ubicación real en el mapa, necesitamos una vista especial llamada MapReader. Cuando envuelvas uno de estos alrededor de tu mapa, se te entregará un objeto especial de MapProxy que es capaz de convertir las ubicaciones de la pantalla en ubicaciones de mapas y de vuelta al revés.

              MapReader { proxy in
                  Map()
                      .onTapGesture { position in
                          if let coordinate = proxy.convert(position, from: .local) {
                              print(coordinate)
                          }
                      }
              } .frame(width: 350, height: 300)
              
              /// Muestra la posicion inicial
              Text("Muestra la posicion inicial de \(namePlace)").font(.title2)
              Map(position: $position)
                  .mapStyle(.imagery)
                  .frame(width: 350, height: 300)
                 
            

              
             /// Aunque ahora estamos pasando una encuadernación al mapa, no podemos simplemente leer la ubicación a medida que el mapa se mueve. En su lugar, tenemos un modificador onMapCameraChange() separado que nos dice cuándo cambia la posición, ya sea inmediatamente o una vez que el movimiento ha terminado.

             /// Por ejemplo, podríamos escribir obtener una actualización cuando hayan terminado de arrastrar el mapa y luego imprimirlo:
              Text("obtener una actualización cuando hayan terminado de arrastrar el mapa y luego imprimirlo").font(.title2)
              Map(position: $position)
                  .onMapCameraChange { context in
                      print(context.region)
                  }
                  .frame(width: 350, height: 300)
              
              /// Alternativamente, puedes hacer que publique actualizaciones continuas como esta:
              Text("Alternativamente, puedes hacer que publique actualizaciones continuas como esta:").font(.title2)
              Map(position: $position)
                  .onMapCameraChange(frequency: .continuous) { context in
                      print(context.region)
                  }.frame(width: 350, height: 300)
              
              /// moostrar un mapa
              Text("Posicion por defecto").font(.title2)
                Map()
                  .frame(width: 350, height: 300)
                  .padding()
                /// Mostrar un mapa de satelite
              Text("Posicion de satelite").font(.title2)
                Map()
                    .mapStyle(.imagery)
                    .frame(width: 350, height: 300)
                    .padding()
                
                /// combinación del mapa satelite y de (calles
              Text("Posicion de satelite y calles").font(.title2)
                Map()
                    .mapStyle(.hybrid)
                    .frame(width: 350, height: 300)
                    .padding()
                
                /// Obtener ambos mapas junto con una elevación realista,
                /// creando un mapa 3D, como este
              Text("Obtener ambos mapas junto con una elevación realista creando un mapa 3D, como este").font(.title2)
                Map()
                    .mapStyle(.hybrid(elevation: .realistic))
                    .frame(width: 350, height: 300)
                    .padding()
              
                /// se puede rotar o acer zoom en misma posicion
              Text("se puede rotar o acer zoom en misma posicion").font(.title2)
                Map(interactionModes: [.rotate, .zoom])
                  .frame(width: 350, height: 300)
                  .padding()
                
                /// Que el mapa este siempre fijo
              Text("Que el mapa este siempre fijo").font(.title2)
                Map(interactionModes: [])
                  .frame(width: 350, height: 300)
                  .padding()
              
              
              // barra de tareas
                  .toolbar{
                      HStack(spacing: 50) {
                          Button("Paris") {
                              namePlace = "Paris"
                              position = MapCameraPosition.region(
                                  MKCoordinateRegion(
                                      center: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522),
                                      span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
                                  )
                              )
                          }

                          Button("Tokyo") {
                              namePlace = "Tokyo"
                              position = MapCameraPosition.region(
                                  MKCoordinateRegion(
                                      center: CLLocationCoordinate2D(latitude: 35.6897, longitude: 139.6922),
                                      span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
                                  )
                              )
                          }
                      }
                  }
              
                  .navigationTitle("Mapas")
          }.padding()
        }
       
    }
}

/// Podrías pensar que el modo continuo siempre es preferible, pero no es tan simple: si estás haciendo una búsqueda en el lugar donde el usuario ha posicionado el mapa, ese es el tipo de cosas que te gustaría hacer solo cuando haya terminado de moverse.

/// La segunda cosa personalizable que quiero ver es colocar anotaciones.

/// Para hacer esto, se necesitan al menos tres pasos dependiendo de su objetivo: definir un nuevo tipo de datos que contenga su ubicación, crear una matriz de los que contengan todas sus ubicaciones y luego agregarlos como anotaciones en el mapa. Sea cual sea el nuevo tipo de datos que cree para almacenar ubicaciones, debe ajustarse al protocolo identificable para que SwiftUI pueda identificar cada marcador de mapa de forma única.

/// Por ejemplo, podríamos comenzar con este tipo de estructura de ubicación:

struct Location: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}

#Preview {
    ContentView()
}
