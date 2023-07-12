//
//  LoginCell.swift
//  PadrinhoAmigo
//
//  Created by Larissa Okabayashi on 11/07/23.
//

import Foundation
import UIKit

class LoginCell: UITableViewCell {
    
    @IBOutlet weak var textFieldPron: UITextField!
    
    func textFieldText(i: Int, user: User){
        let str = textFieldPron.text
        switch i {
        case 0:
            user.pronouns = str
        case 1:
            user.year = Int(str!)
        case 2:
            user.course = str
        case 3:
            user.origin = str
        case 4:
            user.experience = [str!]
        case 5:
            user.interests = [str!]
        case 6:
            user.entities = [str!]
        case 7:
            user.description = str
        default:
            print("")
        }
    }
    
}
