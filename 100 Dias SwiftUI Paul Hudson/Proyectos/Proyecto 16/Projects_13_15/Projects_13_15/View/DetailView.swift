//
//  DetailView.swift
//  Projects_13_15
//
//  Created by Esteban Perez Castillejo on 9/9/24.
//

import SwiftUI

struct DetailView: View {
    @Bindable var model: ModelData
    var body: some View {
        VStack{
            Text(model.title).font(.title.bold())
       
                    if let imageData = model.photo, let uiImage = UIImage(data: imageData){
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 350)
                            .clipShape(.rect(cornerRadius: 10))
                            .shadow(radius: 10)
                }
            Spacer()
        }
    }
}

//#Preview {
//    
//    return DetailView(model: .constant())
//}
