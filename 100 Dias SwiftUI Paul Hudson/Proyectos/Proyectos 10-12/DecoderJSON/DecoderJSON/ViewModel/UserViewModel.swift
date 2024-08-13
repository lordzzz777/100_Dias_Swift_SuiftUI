//
//  UserViewModel.swift
//  DecoderJSON
//
//  Created by Esteban Perez Castillejo on 13/8/24.
//

import Foundation
import Observation

@Observable
class UserViewModel{
    private var userServer:  UserSever = UserSever()
    var user: [User] = []
    
    init(){
        Task{
            await getUser()
        }
    }
    
    func getUser() async {
        do{
            user = try await userServer.getUser()
        }catch{
            print("Ups ocurrio un error -> ", error.localizedDescription)
        }
    }
}
