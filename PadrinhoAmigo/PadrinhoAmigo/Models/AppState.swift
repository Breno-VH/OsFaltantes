//
//  AppState.swift
//  PadrinhoAmigo
//
//  Created by Breno Harris on 12/07/23.
//

import Foundation

class AppState {
    static let shared = AppState()
    private var loggedUser: User?
    var isLoginPressed = false
    private init() {}
    
    func setUser(user: User){
        loggedUser = user
    }
    func getUser() -> User?{
        return loggedUser
    }
}
