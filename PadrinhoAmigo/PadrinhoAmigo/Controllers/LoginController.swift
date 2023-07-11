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
    
    let categories = [
    "Pronome",
    "Ano que entrou",
    "Curso",
    "Local de origem",
    "Experiência",
    "Interesses",
    "Entidades",
    "Descrição"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
      }
    
    @IBAction func Login1Button(_ sender: Any)  {
        Task {
            do {
                if let user = try await attemptLogin(email: emailTextField.text!, password: senhaTextField.text!) {
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
    
    @IBAction func loginButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "RegistrarPerfil", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "RegistrarPerfil2") as! RegistrarPerfilController
        navigationController?.pushViewController(vc, animated: false)
    }
    
}

extension LoginController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categories.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        44
    }
    
    func tableView(_ tableView: UITableView, widthForRowAt indexPath: IndexPath) -> CGFloat {
        361
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell()
        return cell
    }
    
    
    func attemptLogin(email: String, password: String) async throws -> User? {
        if let record = try await manager.fetchUser(email: email, password: password) {
            let user = User(record: record)
            return user
        } else {
            return nil
        }
    }
}

