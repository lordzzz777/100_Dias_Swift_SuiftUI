//
//  FilterCoreImage.swift
//  Instafilter
//
//  Created by Esteban Perez Castillejo on 17/8/24.
//

import SwiftUI

// enumera entre dos tipos de filtros
enum FilterType {
    case sepiaTone
    case pixellate
    case crystallize
}

struct FilterCoreImage: View {
    @State private var image: Image?
    @State private var valuePixellate: CGFloat = 50.0
    @State private var valueSepia: CGFloat = 1.0
    @State private var isShowChange = false

    var body: some View {
        VStack{
            Button("Cambio de filtro"){
                isShowChange.toggle()
        
                loadImage(isShowChange ? .sepiaTone : .pixellate , valuePixellate, valueSepia)
        
            }

            image?
                .resizable()
                .scaledToFit()
            
        }
        .onAppear {
            image = Image(.example)
        }
    }
    
    // Function to load and apply filter to image
    func loadImage(_ filterType: FilterType, _ valueP: CGFloat, _ valueS: CGFloat) {
        guard let inputImage = UIImage(named: "example") else { return } // Replace "example" with your image name
        let beginImage = CIImage(image: inputImage)
        let context = CIContext()
        
        let outputImage: CIImage?
        
        switch filterType {
        case .sepiaTone:
            let filter = CIFilter.sepiaTone()
            filter.inputImage = beginImage
            filter.intensity = Float(valueS)
            outputImage = filter.outputImage
            
        case .pixellate:
            let filter = CIFilter.pixellate()
            filter.inputImage = beginImage
            filter.scale = Float(valueP)
            outputImage = filter.outputImage
        case .crystallize:
            let filter = CIFilter.crystallize()
            filter.inputImage = beginImage
            filter.radius = 200
            outputImage = filter.outputImage
        }
        
        // Attempt to get a CGImage from our CIImage
        guard let cgImage = context.createCGImage(outputImage!, from: outputImage!.extent) else { return }
        
        // Convert that to a UIImage
        let uiImage = UIImage(cgImage: cgImage)
        
        // And convert that to a SwiftUI Image
        image = Image(uiImage: uiImage)
    }
    
}

#Preview {
    FilterCoreImage()
}
