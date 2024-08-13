//
//  Server.swift
//  DecoderJSON
//
//  Created by Esteban Perez Castillejo on 13/8/24.
//

import Foundation
import Observation

enum ApiError: Error {
    case invalidURL
    case invalidRespose
}

@Observable
class UserSever: UserProtocols {

    func getUser() async throws -> [User] {
        
        let jsonURL = "https://www.hackingwithswift.com/samples/friendface.json"
        do{
            guard let url = URL(string: jsonURL) else {
                throw ApiError.invalidURL
            }
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                throw ApiError.invalidURL
            }
            
            let decoder = JSONDecoder()
            
            // Configuramos la estrategia para decodificar fechas en formato ISO 8601
            decoder.dateDecodingStrategy = .iso8601
            
            // Convertimos de snake_case a camelCase automáticamente
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            return try decoder.decode([User].self, from: data)
        }catch{
            throw error
        }
        
    }
    

}

