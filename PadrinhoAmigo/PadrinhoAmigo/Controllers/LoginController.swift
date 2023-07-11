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
    
    @IBAction func registreseButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "RegistrarPerfil", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "RegistrarPerfil1") as! RegistrarPerfilController
        navigationController?.pushViewController(vc, animated: false)
        //self.present(vc, animated: true)
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
    
}

