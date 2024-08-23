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
    var users: [User] = []
    var friends: [Friend] = []
    
    init(){
        Task{
            await getUser()
        }
    }
    
    @MainActor
    func getUser() async {
        do{
            users = try await userServer.getUser()
            for user in users {
                context.insert(user)
               
            }
            
            
        }catch{
            print("Ups ocurrio un error -> ", error.localizedDescription)
        }
    }
}
