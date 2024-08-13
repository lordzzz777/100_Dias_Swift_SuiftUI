//
//  Model.swift
//  DecoderJSON
//
//  Created by Esteban Perez Castillejo on 13/8/24.
//

import Foundation

//MARK: - Usuarios
struct User: Codable {
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company, email, address, about: String
    let registered: Date
    let tags: [String]
    let friends: [Friend]
}

//MARK: - Amigos de los usuarios
struct Friend: Codable {
    let id, name: String
}
