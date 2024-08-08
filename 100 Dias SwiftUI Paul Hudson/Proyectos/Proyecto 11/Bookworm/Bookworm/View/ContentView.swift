//
//  ContentView.swift
//  Bookworm
//
//  Created by Esteban Perez Castillejo on 7/8/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    // Ordenar por titulo
    // @Query(sort: \Book.title) var books: [Book]
    
    // Organizar por calificación
    // @Query(sort: \Book.rating, order: .reverse) var books: [Book]
    
    // Ordenar pior calificación y titulo
    // @Query(sort: [SortDescriptor(\Book.title)]) var books: [Book]
    
    // Al igual que el enfoque más simple de la clasificación, los resultados de clasificación usando SortDescriptor se realiza en orden ascendente de forma predeterminada, es decir, orden alfabético para el texto, pero si quisieras invertir el orden de clasificación, usarías esto en su lugar:
    
    // @Query(sort: [SortDescriptor(\Book.title,  order: .reverse)]) var books: [Book]
    
    // Puede especificar más de un descriptor de clasificación, y se aplicarán en el orden en que los proporcione. Por ejemplo, si el usuario agregó el libro "Forever" de Pete Hamill, luego agregó "Forever" de Judy Blume, un libro completamente diferente que resulta que tiene el mismo título, entonces es útil especificar un segundo campo de clasificación.
    
    // Por lo tanto, podríamos pedir que el título del libro se ordene ascendente primero, seguido del autor del libro ascendente en segundo lugar, así:
    
    @Query(sort: [
        SortDescriptor(\Book.title),
        SortDescriptor(\Book.author)
    ]) var books : [Book]
    
    // Eliminar libros
    func deleteBooks(at offsets: IndexSet){
        for offset in offsets{
            // Encuentra este libro en nuestra consulta
            let book = books[offset]
            
            // Eliminarlo del contexto
            modelContext.delete(book)
        }
    }

    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(books) { book in
                    NavigationLink(value: book) {
                        HStack {
                            EmojiRatingView(ratinng: book.rating)
                                .font(.largeTitle)

                            VStack(alignment: .leading) {
                                Text(book.title)
                                    .font(.headline)
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }.onDelete(perform: deleteBooks)
            }
            .navigationDestination(for: Book.self) { book in
                DetailView(book: book)
            }
               .navigationTitle("Bookworm")
               .toolbar {
                   ToolbarItem(placement: .topBarTrailing) {
                       Button("Add Book", systemImage: "plus") {
                           showingAddScreen.toggle()
                       }
                   }
               }
               .sheet(isPresented: $showingAddScreen) {
                   AddBookView()
               }
               .toolbar{
                   ToolbarItem(placement: .topBarLeading, content: {
                       EditButton()
                   })
               }
       }
    }
}

#Preview {
    ContentView()
}
