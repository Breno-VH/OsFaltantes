//
//  LoginController.swift
//  PadrinhoAmigo
//
//  Created by Breno Harris on 11/07/23.
//

import UIKit
import CloudKit


class LoginController: UIViewController, UITextFieldDelegate {
    private let manager = CloudKitManager()
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var senhaTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        senhaTextField.isSecureTextEntry = true
        self.emailTextField.delegate = self
        self.senhaTextField.delegate = self
      }
    
    @IBAction func Login1Button(_ sender: Any) {
        Task {
            do {
                if let user = try await attemptLogin(email: emailTextField.text!, password: senhaTextField.text!) {
                    
                    AppState.shared.loggedUser = user
                    
                    let storyboard = UIStoryboard(name: "Perfil", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "Profile") as! PerfilPessoalController
                    
                    navigationController?.pushViewController(vc, animated: false)
                    print(user.name)
                } else {
                    print("usuário não encontrado")
                }
            } catch {
                print(error)
            }
        }
    }
    
    @IBAction func registreseButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "RegistrarPerfil", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "RegistrarPerfil1") as! RegistrarPerfilController
        navigationController?.pushViewController(vc, animated: false)
        //self.present(vc, animated: true)
    }
    
    
    func attemptLogin(email: String, password: String) async throws -> User? {
        if let record = try await manager.fetchUser(email: email, password: password) {
            let user = User(record: record)
            return user
        }
        return nil
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return emailTextField.resignFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

