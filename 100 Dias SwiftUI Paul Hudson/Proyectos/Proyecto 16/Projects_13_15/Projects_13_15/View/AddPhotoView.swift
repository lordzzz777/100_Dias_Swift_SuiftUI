//
//  AddPhoto.swift
//  Projects_13_15
//
//  Created by Esteban Perez Castillejo on 9/9/24.
//

import SwiftUI
import SwiftData
import PhotosUI

struct AddPhotoView: View {
    @Environment(\.modelContext) var contex
    @Environment(\.dismiss) var dismiss
    @State private var processedImage: Image?
    @State private var image: Data?
    @State private var selectedItem: PhotosPickerItem?
    @State private var title = ""
    
    var body: some View {
        NavigationStack{
            Form{
                    TextField("Title", text: $title).padding(.horizontal)

                    VStack{
                        
                        PhotosPicker(selection: $selectedItem, matching: .images, photoLibrary: .shared(), label: {
                            if let image , let uImage = UIImage(data: image){
                                Image(uiImage: uImage)
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(.rect(cornerRadius: 8))
                                    .frame(width: 350, height: 200)
                                    .shadow(radius: 10)
                                
                            }else {
                                ContentUnavailableView("No Picture", systemImage: "photo.badge.plus", description: Text("Tap to import a photo"))
                            }
                        })
                        .task(id: selectedItem) {
                            if let data = try? await selectedItem?.loadTransferable(type: Data.self){
                                image = data
                            }
                        }
                    }
                    
                    Button(action: {
                       // logica de guasrdado ....
                        let items = ModelData(title: title, photo: image)
                        contex.insert(items)
                        dismiss()
                    }, label: {
                        Text("Save").font(.title.bold())
                            .foregroundStyle(title.isEmpty ? .black : .white)
                            .padding(.horizontal, 124)
                            .padding(.vertical, 5)
                    }).background(RoundedRectangle(cornerRadius: 9.0))
                        .foregroundStyle(title.isEmpty ? .gray : .green)
                    .disabled(title.isEmpty ? true : false)
                
                

            }
            .toolbar{
                Button(role: .cancel, action: {
                    dismiss()
                }, label: {
                    Text("Cancel")
                        .foregroundStyle(.red)
                })
            }
        }
    }
    
}

#Preview {
    
   return AddPhotoView()
            .modelContainer(for: ModelData.self  )
}
