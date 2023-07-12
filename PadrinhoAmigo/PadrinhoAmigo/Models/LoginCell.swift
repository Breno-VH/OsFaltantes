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
    
    func textFieldText() -> String {
        return textFieldPron.text!
    }
    
}
