//
//  TutorialName.swift
//  CupcakeCorner
//
//  Created by Esteban Perez Castillejo on 1/8/24.
//

import SwiftUI

@Observable
class User: Codable {
    enum CodingKeys: String, CodingKey{
        case _name = "Manolo"
    }
    var name = "Manolo"
}

struct TutorialName: View {
    var body: some View {
        Button("Encoding Manolo", action: encodeManolp)
    }
    
    func encodeManolp(){
        let data = try! JSONEncoder().encode(User())
        let str = String(decoding: data, as: UTF8.self)
        print(str)
    }
}

#Preview {
    TutorialName()
}
