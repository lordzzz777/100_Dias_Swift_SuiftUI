//
//  Model.swift
//  SwiftDataProjectTuto
//
//  Created by Esteban Perez Castillejo on 10/8/24.
//

import SwiftData
import Foundation

@Model
class User {
    var name: String
    var city: String
    var joinDate: Date
    @Relationship(deleteRule: .cascade) var jobs = [Job]()
    
    init(name: String, city: String, joinDate: Date, jobs: [Job] = [Job]()) {
        self.name = name
        self.city = city
        self.joinDate = joinDate
        self.jobs = jobs
    }
}

@Model
class Job {
    var name: String
    var priority: Int
    var owner: User?

    init(name: String, priority: Int, owner: User? = nil) {
        self.name = name
        self.priority = priority
        self.owner = owner
    }
}
