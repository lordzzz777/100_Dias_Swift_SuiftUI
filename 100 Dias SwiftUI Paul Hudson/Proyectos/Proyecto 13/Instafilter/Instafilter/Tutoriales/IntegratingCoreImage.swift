//
//  IntegratingCoreImage.swift
//  Instafilter
//
//  Created by Esteban Perez Castillejo on 17/8/24.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct IntegratingCoreImage: View {
    @State private var image: Image?
    
    var body: some View {
        VStack{
            image?
                .resizable()
                .scaledToFit()
        }
        .onAppear(perform: loadImage)
    }
    
    // Funcion de carga de imagen
    func loadImage() {
        let inputImage = UIImage(resource: .example)
        let beginImage = CIImage(image: inputImage)
        let contexr = CIContext()
        // Esto crea un filtro tono sepia
        // let currentFilter = CIFilter.sepiaTone()
        // currentFilter.intensity = 1
        
        // Esto Peselea la imagen
        // let currentFilter = CIFilter.pixellate()
        // currentFilter.scale = 30
        
        // Esto crea un efecto crista
        // let currentFilter = CIFilter.crystallize()
        // currentFilter.radius = 70
        
        // Esto crea un filtro de distorsión de giro
        // let currentFilter = CIFilter.twirlDistortion()
        // currentFilter.radius = 1000
        // currentFilter.center = CGPoint(x: inputImage.size.width / 2, y: inputImage.size.height / 2)
        
        // Esto crea un filtro de distorsión de giro, Api antigua
        let currentFilter = CIFilter.twirlDistortion()
        
        let amount = 1.0

        let inputKeys = currentFilter.inputKeys

        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(amount, forKey: kCIInputIntensityKey) }
        if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(amount * 200, forKey: kCIInputRadiusKey) }
        if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(amount * 10, forKey: kCIInputScaleKey) }
        currentFilter.inputImage = beginImage
        
       // Obtenga una imagen CI de nuestro filtro o salga si eso falla
        guard let outputImage = currentFilter.outputImage else {return}
        
       // Intentar obtener una CGIImage de nuestra CIImage
        guard let cgImage = contexr.createCGImage(outputImage, from: outputImage.extent) else {return}
        
       // Convertir eso en una imagen de la interfaz de usuario
        let uiImage = UIImage(cgImage: cgImage)
       
       // Y convertir eso en una imagen de SwiftUI
        image = Image(uiImage: uiImage)
        
        
        //image = Image(.example)
    }
}

#Preview {
    IntegratingCoreImage()
}
