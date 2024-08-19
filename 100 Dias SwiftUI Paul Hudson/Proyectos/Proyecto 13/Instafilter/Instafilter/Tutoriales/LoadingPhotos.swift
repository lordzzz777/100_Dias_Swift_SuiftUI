//
//  LoadingPhotos.swift
//  Instafilter
//
//  Created by Esteban Perez Castillejo on 19/8/24.
//

import PhotosUI
import SwiftUI

struct LoadingPhotos: View {
    // Almacena la seleccion
    @State private var onlyPickerItem: PhotosPickerItem?
    
    // Almacena el elemento seleccionado
    @State private var onlySelectedImage: Image?
    
    
    // Array de elementos de selección
    @State private var pickerItems = [PhotosPickerItem]()
    
    // Almacena los elementos seleccionados
    @State private var selectedImage = [Image]()
    
    var body: some View {
        // Selecciona una solo foto del carrete
        VStack{
            onlySelectedImage?
                .resizable()
                .scaledToFit()
            PhotosPicker("Select a pintura", selection: $onlyPickerItem, matching: .images)
        }
        .onChange(of: onlyPickerItem){
            Task{
                onlySelectedImage = try await onlyPickerItem?.loadTransferable(type: Image.self)
            }
        }
        .padding()
        
        
        // Serlecciona varias fotos
        VStack{
            
            ScrollView{
                ForEach(0..<selectedImage.count, id: \.self){ i in
                    selectedImage[i]
                        .resizable()
                        .scaledToFit()
                    
                }
            }
            
            /// `PhotosPicker("Select images", selection: $pickerItam)`
            
            // Limitar al usuario el numero de fotos a cargar
            ///`PhotosPicker("Select images", selection: $pickerItam, maxSelectionCount: 2)`
            
            /// Hay dos últimas formas de personalizar la importación de fotos, empezando por la etiqueta. Al igual que con muchas vistas de SwiftUI, puede proporcionar una etiqueta completamente personalizada si lo prefiere, que podría ser una vista de etiqueta o algo completamente personalizado:
           
           /// `PhotosPicker( selection: $pickerItam, maxSelectionCount: 2, matching: .images){ Label("Select a picture", systemImage: "photo") }`
            
            ///  Y la última forma es limitar los tipos de imágenes que se pueden importar. Hemos utilizado .images aquí en todos los ámbitos, lo que significa que obtendremos fotos regulares, capturas de pantalla, panoramas y más. Puedes aplicar un filtro más avanzado usando `.any()`, `.all()` y `.not()`, y pasarles una matriz. Por ejemplo, esto coincide con todas las imágenes, excepto las capturas de pantalla:
            
            PhotosPicker(selection: $pickerItems, maxSelectionCount: 3, matching: .any(of: [.images, .not(.screenshots)])) {
                Label("Select a picture", systemImage: "photo")
            }
        }
        .onChange(of: pickerItems){
            Task{
                selectedImage.removeAll()
                for item in pickerItems {
                    if let loadImage = try await item.loadTransferable(type: Image.self){
                        selectedImage.append(loadImage)
                    }
                }
            }
        }
        .padding()
        
    }
}

#Preview {
    LoadingPhotos()
}
