//
//  ContentView.swift
//  FriendsFavoriteMovies
//
//  Created by Esteban Perez Castillejo on 24/4/24.
//

import SwiftUI
import SwiftData

struct  MovieList: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var movies: [Movie]
    
    @State private var newMovie: Movie?
    
    init(titleFilter: String = "") {
        let predicate = #Predicate<Movie>{ movie in
            titleFilter.isEmpty || movie.title.localizedStandardContains(titleFilter)
        }
        
        _movies = Query(filter: predicate, sort: \Movie.title)
    }
    
    var body: some View {

            Group{
                if !movies.isEmpty{
                    List {
                        ForEach(movies) { movie in
                            NavigationLink {
                                MovieDetail(movie: movie)
                            } label: {
                                Text(movie.title)
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }
                }else {
                    ContentUnavailableView{
                        Label("No Movie", systemImage: "film.stack")
                    }
                }
            }
            .navigationTitle("Movies")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addMovie) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            .sheet(item: $newMovie){ movie in
                NavigationStack{
                    MovieDetail(movie: movie, isNew: true)
                }
                .interactiveDismissDisabled()
            }

    }
    
    private func addMovie() {
        withAnimation {
            let newItem = Movie(title: "", releaseDate: .now)
            modelContext.insert(newItem)
            newMovie = newItem
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(movies[index])
            }
        }
    }
}

#Preview {
    NavigationStack {
        MovieList()
            .modelContainer(SampleData.shared.modelContainer)
    }
}


#Preview("Empty List") {
    NavigationStack {
        MovieList()
            .modelContainer(for: Movie.self, inMemory: true)
    }
}


#Preview("Filtered") {
    NavigationStack {
        MovieList(titleFilter: "tr")
            .modelContainer(SampleData.shared.modelContainer)
    }
}
