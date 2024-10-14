//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Esteban Pérez Castillejo on 9/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    @State private var favorites = Favorites()
    
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    
    @State private var sortOrder: SortOrder = .defaultOrder
    
    enum SortOrder {
        case defaultOrder, alphabetical, country
    }
    
    var sortedResorts: [Resort] {
        switch sortOrder {
        case .defaultOrder:
            return resorts
        case .alphabetical:
            return resorts.sorted { $0.name < $1.name }
        case .country:
            return resorts.sorted { $0.country < $1.country }
        }
    }
    
    var filteredResorts: [Resort] {
        if searchText.isEmpty {
            return sortedResorts
        } else {
            return sortedResorts.filter { $0.name.localizedStandardContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List(filteredResorts) { resort in
                NavigationLink(value: resort) {
                    HStack {
                        Image(resort.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25)
                            .clipShape(
                                .rect(cornerRadius: 5)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 1)
                            )

                        VStack(alignment: .leading) {
                            Text(resort.name)
                                .font(.headline)
                            Text("\(resort.runs) runs")
                                .foregroundStyle(.secondary)
                        }
                    }
                    
                    if favorites.contains(resort) {
                        Spacer()
                        Image(systemName: "heart.fill")
                            .accessibilityLabel("This is a favorite resort")
                            .foregroundStyle(.red)
                    }
                }
            }
            .navigationTitle("Resorts")
            .navigationDestination(for: Resort.self) { resort in
                ResortView(resort: resort)
            }
            .searchable(text: $searchText, prompt: "Search for a resort")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Picker("Sort Order", selection: $sortOrder) {
                        Text("Default").tag(SortOrder.defaultOrder)
                        Text("Alphabetical").tag(SortOrder.alphabetical)
                        Text("Country").tag(SortOrder.country)
                    }
                    .pickerStyle(.segmented)
                }
            }
        } detail: {
            WelcomeView()
        }
        .environment(favorites)
    }
}

#Preview {
    ContentView()
}
