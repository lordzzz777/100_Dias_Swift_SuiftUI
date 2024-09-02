//
//  EditView.swift
//  LocationsToMap
//
//  Created by Esteban Perez Castillejo on 27/8/24.
//

import SwiftUI

struct EditView: View {
    
    enum LoadingState {
        case loading, loaded, failed
    }
    
    
    @Environment(\.dismiss) var dismiss
    var location: Location

    @State private var loadingState = LoadingState.loading
    @State private var pages = [Page]()
    @State private var name: String
    @State private var description: String
    
    init(location: Location, onSave: @escaping (Location) -> Void) {
        self.location = location
        self.onSave = onSave

        _name = State(initialValue: location.name)
        _description = State(initialValue: location.description)
    }

    var onSave: (Location) -> Void
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Place name", text: $name)
                    TextField("Description", text: $description)
                }
                
                Section("Nearby…") {
                    switch loadingState {
                    case .loaded:
                        ForEach(pages, id: \.pageid) { page in
                            Text(page.title)
                                .font(.headline)
                            + Text(": ") +
                            Text(page.description)
                                .italic()
                        }
                    case .loading:
                        Text("Loading…")
                    case .failed:
                        Text("Please try again later.")
                    }
                }
            }
            .navigationTitle("Place details")
            .toolbar {
                ToolbarItem(placement: .automatic, content: {
                    Button("Save") {
                        var newLocation = location
                        newLocation.id = UUID()
                        newLocation.name = name
                        newLocation.description = description

                        onSave(newLocation)
                        dismiss()
                    }
                })
                
                ToolbarItem(placement: .navigation, content: {
                    Button("Cancelar"){
                        dismiss()
                    }.foregroundStyle(.red)
                })

                
            }
            .task {
                await fetchNearbyPlaces()
            }
        }
    }
    
    func fetchNearbyPlaces() async {
        let urlString = "https://en.wikipedia.org/w/api.php?ggscoord=\(location.latitude)%7C\(location.longitude)&action=query&prop=coordinates%7Cpageimages%7Cpageterms&colimit=50&piprop=thumbnail&pithumbsize=500&pilimit=50&wbptterms=description&generator=geosearch&ggsradius=10000&ggslimit=50&format=json"

        guard let url = URL(string: urlString) else {
            print("Bad URL: \(urlString)")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            // ¡Tenemos algunos datos de vuelta!
            let items = try JSONDecoder().decode(Result.self, from: data)
            
            // Éxito - convierta los valores de la matriz a nuestra matriz de páginas
            pages = items.query.pages.values.sorted()
            loadingState = .loaded
        } catch {
            // Si todavía estamos aquí, significa que la solicitud falló de alguna manera
            loadingState = .failed
        }
    }
}

#Preview {
    EditView(location: .example) { _ in }
}
