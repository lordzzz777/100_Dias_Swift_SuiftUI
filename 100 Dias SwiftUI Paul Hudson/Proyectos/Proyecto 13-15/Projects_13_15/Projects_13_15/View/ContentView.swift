//
//  ContentView.swift
//  Projects_13_15
//
//  Created by Esteban Perez Castillejo on 9/9/24.
//

import SwiftUI
import SwiftData


struct ContentView: View {
    @Environment(\.modelContext) var context
    @Query(sort: \ModelData.title) var model: [ModelData]
    
    @State private var isShowModal = false
  
    var body: some View {
        NavigationStack{
            List{
                ForEach(model, id: \.id){ item in
                    NavigationLink(destination: {
                        DetailView(model: item)
                    }, label: {
                        HStack{
                            
                            if let imageData = item.photo, let uiImage = UIImage(data: imageData){
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 70)
                                    .clipShape(.rect(cornerRadius: 10))
                                
                            }
                            
                            Text(item.title).padding(.horizontal)
                        }
                    })
                    
                }.onDelete(perform: { i in
                    for index in i {
                        removeItem(model[index])
                    }
                })
            }
            .navigationTitle("Data Photo")
            .toolbar{
                Button(action: {
                    isShowModal.toggle()
                }, label: {
                    Image(systemName: "plus")
                })
            }
            .sheet(isPresented: $isShowModal, content: {
                AddPhotoView()
                    .presentationDetents([.medium])
            })
        }
    }

    func removeItem(_ Item: ModelData){
        context.delete(Item)
    }
    
    
}

#Preview {
    ContentView()
        .modelContainer(for: ModelData.self)
}
