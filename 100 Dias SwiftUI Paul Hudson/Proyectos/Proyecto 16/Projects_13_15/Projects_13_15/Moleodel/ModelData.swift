//
//  ModelData.swift
//  Projects_13_15
//
//  Created by Esteban Perez Castillejo on 9/9/24.
//

import Foundation
import SwiftData

@Model
class ModelData {
    var id = UUID()
    var title: String
    @Attribute(.externalStorage) var photo: Data?
    
    init(id: UUID = UUID(), title: String, photo: Data? = nil) {
        self.id = id
        self.title = title
        self.photo = photo
    }
}
