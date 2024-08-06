//
//  Model.swift
//  Bookworm
//
//  Created by Esteban Perez Castillejo on 6/8/24.
//

import SwiftUI
import SwiftData

@Model
class Student{
    var id: UUID
    var name: String
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}

