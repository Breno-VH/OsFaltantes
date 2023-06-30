//
//  GetUser.swift
//  PadrinhoAmigo
//
//  Created by Breno Harris on 29/06/23.
//

import UIKit

protocol UserDelegate: NSObjectProtocol {
    func didRecieveDataUpdate(data: UserModel)
}
