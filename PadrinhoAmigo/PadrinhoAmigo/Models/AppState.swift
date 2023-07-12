//
//  AppState.swift
//  PadrinhoAmigo
//
//  Created by Breno Harris on 12/07/23.
//

import Foundation

class AppState {
    static let shared = AppState()
    private init() {}
    
    var loggedUser: User?
}
