//
//  Model.swift
//  DecoderJSON
//
//  Created by Esteban Perez Castillejo on 13/8/24.
//

import Foundation
import SwiftData

////MARK: - Usuarios
//struct User: Codable {
//    let id: String
//    let isActive: Bool
//    let name: String
//    let age: Int
//    let company, email, address, about: String
//    let registered: Date
//    let tags: [String]
//    let friends: [Friend]
//}
//
////MARK: - Amigos de los usuarios
//struct Friend: Codable {
//    let id, name: String
//}

@Model
class User: Codable, Identifiable {
    
    enum CodingKeys: CodingKey {
        case id, name, age, company, email, address, about, registered
        case friends
        case tags
        case isActive
       }
    
    var id: String 
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    @Relationship(deleteRule: .cascade) var friends: [Friend]
    
    init(id: String = "" ,
         isActive: Bool = false,
         name: String = "",
         age: Int = 0,
         company: String = "",
         email: String = "",
         address: String = "",
         about: String = "",
         registered: Date = Date(),
         tags: [String] = [""],
         friends: [Friend] = []
    )
    
    {
        self.id = id
        self.isActive = isActive
        self.name = name
        self.age = age
        self.company = company
        self.email = email
        self.address = address
        self.about = about
        self.registered = registered
        self.tags = tags
        self.friends = friends
    }
    
    required init(from decoder: Decoder) throws {
         let container = try decoder.container(keyedBy: CodingKeys.self)
         self.id = try container.decode(String.self, forKey: .id)
         self.isActive = try container.decode(Bool.self, forKey: .isActive)
         self.name = try container.decode(String.self, forKey: .name)
         self.age = try container.decode(Int.self, forKey: .age)
         self.company = try container.decode(String.self, forKey: .company)
         self.email = try container.decode(String.self, forKey: .email)
         self.address = try container.decode(String.self, forKey: .address)
         self.about = try container.decode(String.self, forKey: .about)
         self.registered = try container.decode(Date.self, forKey: .registered)
         self.tags = try container.decode([String].self, forKey: .tags)
         self.friends = try container.decode([Friend].self, forKey: .friends)
     }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.age, forKey: .age)
        try container.encode(self.company, forKey: .company)
        try container.encode(self.email, forKey: .email)
        try container.encode(self.address, forKey: .address)
        try container.encode(self.about, forKey: .about)
        try container.encode(self.registered, forKey: .registered)
        try container.encode(self.tags, forKey: .tags)
        try container.encode(self.friends, forKey: .friends)
    }
}

@Model
class Friend: Codable, Identifiable {
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
    
    var id: String
    var name: String
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
    }
}
