//
//  Procolos.swift
//  DecoderJSON
//
//  Created by Esteban Perez Castillejo on 13/8/24.
//

import Foundation

//MARK: - Define la intefaz oara obtener los datos de usuario y amigos
protocol UserProtocols{
    func getUser() async throws -> [User]
}

