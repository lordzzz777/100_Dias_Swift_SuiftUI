//
//  MusicM;odel.swift
//  CupcakeCorner
//
//  Created by Esteban Perez Castillejo on 31/7/24.
//

import Foundation

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}
