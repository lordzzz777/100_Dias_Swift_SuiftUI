//
//  ContentView.swift
//  Instafilter
//
//  Created by Esteban Perez Castillejo on 16/8/24.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI
import PhotosUI

struct ContentView: View {
    @State private var processedImage: Image?
    @State private var filterIntensity = 0.5
    @State private var ratio = 0.5
    @State private var selectedItem: PhotosPickerItem?
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    @State private var showingFilters = false
    @State private var isSetFilters = false
    
    @AppStorage("filterCount") var filterCount = 0
    @Environment(\.requestReview) var requestReview
    
    let context = CIContext()
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading) {
                Spacer()
                
                PhotosPicker(selection: $selectedItem){
                    if let processedImage {
                        processedImage
                            .resizable()
                            .scaledToFit()
                    } else {
                        ContentUnavailableView("No Picture", systemImage: "photo.badge.plus", description: Text("Tap to import a photo"))
                    }
                }
                .onChange(of: selectedItem, loadImage)
                Spacer()
                
                HStack{
                    Text("Intensity: ")
                    Slider(value: $filterIntensity)
                        .onChange(of: filterIntensity, applyProcessing)
                }.disabled((selectedItem != nil && isSetFilters == false) ? false : true)
                HStack{
                    Text("Radio:      ")
                    Slider(value: $ratio)
                        .onChange(of: ratio, applyProcessing)
                }.disabled((selectedItem != nil && isSetFilters == true) ? false : true)
                    
                    // Cambiar Filtro
                    Button("Change Filter", action: changeFilter)
                    .disabled((selectedItem != nil) ? false : true)

              
                Spacer()
                
                if let processedImage {
                    ShareLink(item: processedImage, preview: SharePreview("Instafilter image", image: processedImage))
                }
                
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("Instafilter")
            .confirmationDialog("Select a filter", isPresented: $showingFilters) {
                Button("Crystallize") { setFilter(CIFilter.crystallize()) }
                Button("Edges") { setFilter(CIFilter.edges()) }
                Button("Gaussian Blur") { setFilter(CIFilter.gaussianBlur()) }
                Button("Pixellate") { setFilter(CIFilter.pixellate()) }
                Button("Sepia Tone") { setFilter(CIFilter.sepiaTone()) }
                Button("Unsharp Mask") { setFilter(CIFilter.unsharpMask()) }
                Button("Vignette") { setFilter(CIFilter.vignette()) }
                Button("bokehBlur") { setFilter(CIFilter.bokehBlur()) }
                Button("bumpDistortion") { setFilter(CIFilter.bumpDistortion()) }
                Button("bloom") { setFilter(CIFilter.bloom()) }
                
                Button("Cancel", role: .cancel) { }
            }
        }
    }
    
    func loadImage() {
        Task {
            guard let imageData = try await selectedItem?.loadTransferable(type: Data.self) else { return }
            guard let inputImage = UIImage(data: imageData) else { return }

            let beginImage = CIImage(image: inputImage)
            currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
            applyProcessing()
        }
    }
    
    func applyProcessing() {
        //  currentFilter.intensity = Float(filterIntensity)
        let inputKeys = currentFilter.inputKeys
        
        if inputKeys.contains(kCIInputIntensityKey) { currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey)
            isSetFilters = false
        }
        if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(ratio * 200, forKey: kCIInputRadiusKey)
            isSetFilters = true
        }
        if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(filterIntensity * 10, forKey: kCIInputScaleKey)
            isSetFilters = false
        }
        //if inputKeys.contains(kCIInputRadiusKey){ currentFilter.setValue(ratio * 200, forKey: kCIInputRadiusKey)}
        guard let outputImage = currentFilter.outputImage else { return }
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }

        let uiImage = UIImage(cgImage: cgImage)
        processedImage = Image(uiImage: uiImage)
        
    }
    
    @MainActor func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        loadImage()
        
        filterCount += 1

        if filterCount >= 20 {
            requestReview()
        }
    }
    
    func changeFilter() {
        showingFilters = true
  
    }
    

}

#Preview {
    ContentView()
}
