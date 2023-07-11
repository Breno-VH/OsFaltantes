//
//  LoginController.swift
//  PadrinhoAmigo
//
//  Created by Breno Harris on 11/07/23.
//

import UIKit
import CloudKit


class RegistrarController: UIViewController {
    private let manager = CloudKitManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
      }
    
    func saveUser(user: User) async {
        manager.save(user: user)
        
    }

}


extension RegistrarController {
    
    func validateEmail(email: String) -> Bool {
        do {
            let pattern = "[a-z]{1}[0-9]{6}@dac.unicamp.br"
            let academicEmailRegex = try NSRegularExpression(pattern: pattern)
            let range = NSRange(location: 0, length: email.count)
            
            if academicEmailRegex.firstMatch(in: email, range: range) != nil {
                return true
            }
            
        } catch let error {
            print(error.localizedDescription)
            return false
        }
        return false
    }

}
