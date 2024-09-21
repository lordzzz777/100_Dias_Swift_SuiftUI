//
//  Prospect.swift
//  HotProspects
//
//  Created by Esteban Perez Castillejo on 17/9/24.
//

import Foundation
import SwiftData

@Model
class Prospect {
    var name: String
    var emailAddress: String
    var isContacted: Bool
    var isPotential: Bool
    init(name: String, emailAddress: String, isContacted: Bool, isPotential: Bool = false) {
        self.name = name
        self.emailAddress = emailAddress
        self.isContacted = isContacted
        self.isPotential = isPotential
    }
}

