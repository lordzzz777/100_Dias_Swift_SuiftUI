//
//   ContentView.swift
//  FriendsFavoriteMovies
//
//  Created by Esteban Perez Castillejo on 28/4/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            FilteredMovieList()
                .tabItem {
                    Label("Movies", systemImage: "film.stack")
                }
            FriendList()
                .tabItem {
                    Label("Frien", systemImage: "person.and.person")
                }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(SampleData.shared.modelContainer)
}
