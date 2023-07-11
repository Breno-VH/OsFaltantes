//
//  LoginController.swift
//  PadrinhoAmigo
//
//  Created by Breno Harris on 11/07/23.
//

import UIKit
import CloudKit


class LoginController: UIViewController {
    private let manager = CloudKitManager()
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var senhaTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
      }
    
    @IBAction func Login1Button(_ sender: Any) {
    }
    
    @IBAction func registreseButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "RegistrarPerfil", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "RegistrarPerfil1") as! RegistrarPerfilController
        navigationController?.pushViewController(vc, animated: false)
        //self.present(vc, animated: true)
    }
    
}


