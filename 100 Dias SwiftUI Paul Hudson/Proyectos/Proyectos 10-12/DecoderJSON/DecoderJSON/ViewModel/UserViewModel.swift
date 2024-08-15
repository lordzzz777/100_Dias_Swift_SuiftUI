//
//  UserViewModel.swift
//  DecoderJSON
//
//  Created by Esteban Perez Castillejo on 13/8/24.
//

import Observation
import SwiftUI
import SwiftData

@Observable
final class UserViewModel{
    static let shared = UserViewModel()
    let contened = try! ModelContainer(for: User.self, Friend.self)
    
    
    @MainActor
    var context: ModelContext{
        contened.mainContext
    }
    
    private var userServer:  UserSever = UserSever()
    var user: [User] = []
    var friends: [Friend] = []
    
    init(){
        Task{
            await getUser()
        }
    }
    
    @MainActor
    func getUser() async {
        do{
            user = try await userServer.getUser()
            for user in try await userServer.getUser(){
                context.insert(user)
               
            }
            
            
        }catch{
            print("Ups ocurrio un error -> ", error.localizedDescription)
        }
    }
}
