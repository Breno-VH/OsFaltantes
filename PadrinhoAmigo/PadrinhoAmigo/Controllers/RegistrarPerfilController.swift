//
//  LoginController.swift
//  PadrinhoAmigo
//
//  Created by Breno Harris on 11/07/23.
//

import UIKit
import CloudKit


class RegistrarPerfilController: UIViewController {
    
    private let manager = CloudKitManager()
    
    @IBOutlet weak var registrarTable: UITableView!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var SenhaTextField: UITextField!
    
    @IBOutlet weak var ConfirmarSenhaTextField: UITextField!
    
    
    @IBOutlet weak var label: UILabel!
    
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
        registrarTable?.delegate = self
        registrarTable?.dataSource = self
        registrarTable?.layer.cornerRadius = 14
      }
    
    func saveUser(user: User) async {
        manager.save(user: user)
        
    }
    
    
    @IBAction func loginButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "RegistrarPerfil", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "RegistrarPerfil2") as! RegistrarPerfilController
        navigationController?.pushViewController(vc, animated: false)
    }
    
    @IBAction func ProxButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "RegistrarPerfil", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "RegistrarPerfil3") as! RegistrarPerfilController
        navigationController?.pushViewController(vc, animated: false)
    }
    
    @IBAction func plusButton(_ sender: Any) {
        
    }
    
    @IBAction func salvarButton(_ sender: Any) {
    }
    
}


extension RegistrarPerfilController {
    
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

extension RegistrarPerfilController: UITableViewDataSource, UITableViewDelegate{
    
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
        //let cell: UITableViewCell = UITableViewCell()
        let cell: LoginCell = registrarTable.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! LoginCell
        cell.textLabel?.font = UIFont.systemFont(ofSize: 17)
        cell.textLabel?.text = categories[indexPath.row]
        return cell
    }
    
}

