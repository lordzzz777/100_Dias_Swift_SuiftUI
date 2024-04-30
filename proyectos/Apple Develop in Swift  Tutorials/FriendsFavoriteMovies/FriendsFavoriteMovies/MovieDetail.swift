//
//  MovieDetail.swift
//  FriendsFavoriteMovies
//
//  Created by Esteban Perez Castillejo on 25/4/24.
//

import SwiftUI

struct MovieDetail: View {
    
    @Bindable var movie: Movie
    let isNew: Bool
    
    @Environment (\.dismiss)private var dismiss
    @Environment (\.modelContext) private var modelContext
    
    init(movie: Movie, isNew: Bool = false){
        self.movie = movie
        self.isNew = isNew
    }
    
    var sotedFriends: [Friend]{
        movie.favoritedBay.sorted{ first, second in
            first.name < second.name
        }
    }
    
    var body: some View {
        Form{
            TextField("Movie title", text: $movie.title)
            
            DatePicker("Release date", selection: $movie.releaseDate, displayedComponents: .date)
            
            Section("Favorited By"){
                if !movie.favoritedBay.isEmpty{
                    ForEach(sotedFriends){ friend in
                        Text(friend.name)
                    }
                }
            }
        }
        .navigationTitle(isNew ? "New Movie" : "Movie")
        .toolbar {
            if isNew {
                ToolbarItem(placement: .confirmationAction){
                    Button("Done"){
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction){
                    Button("Cancel"){
                        modelContext.delete(movie)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack{
        MovieDetail(movie: SampleData.shared.movie)
    }
    .modelContainer(SampleData.shared.modelContainer)
}

#Preview("New Movie"){
    NavigationStack{
        MovieDetail(movie: SampleData.shared.movie, isNew: true)
            .navigationBarTitleDisplayMode(.inline)
    }
    .modelContainer(SampleData.shared.modelContainer)
}
