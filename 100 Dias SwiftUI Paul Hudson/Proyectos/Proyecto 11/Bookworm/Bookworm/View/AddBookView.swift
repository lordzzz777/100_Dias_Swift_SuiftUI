//
//  AddBookView.swift
//  Bookworm
//
//  Created by Esteban Perez Castillejo on 7/8/24.
//

import SwiftData
import SwiftUI

struct AddBookView: View {
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    @State private var review = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack{
            Form {
                Section{
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section("Escribe una reseña") {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                }
                
                Section {
                    Button("Save") {
                        let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating, date: Date.now)
                            modelContext.insert(newBook)
                            dismiss()
                    }.disabled(title.isEmpty || author.isEmpty ? true : false)
                }
            }
            .navigationTitle("Add Book")
            .toolbar{
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(.red)
                })
            }
        }
    }
}

#Preview {
    AddBookView()
}
