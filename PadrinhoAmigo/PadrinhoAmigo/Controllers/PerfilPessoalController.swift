//
//  PerfilPessoal.swift
//  PadrinhoAmigo
//
//  Created by Larissa Okabayashi on 11/07/23.
//

import Foundation
import UIKit

class PerfilPessoalController: UIViewController {
    
    let categories = [
    "Curso",
    "Ano que entrou",
    "Origem",
    "Entidades",
    "Interesses",
    "Experiência",
    "Descrição"
    ]
    
    @IBOutlet weak var perfilTableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        perfilTableview.delegate = self
        perfilTableview.dataSource = self
        
      }
    
}

extension PerfilPessoalController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categories.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 6{
           return 100
        }
        return 74
    }
    
    func tableView(_ tableView: UITableView, widthForRowAt indexPath: IndexPath) -> CGFloat {
        361
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PerfilCell = perfilTableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PerfilCell
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        cell.textLabel?.text = categories[indexPath.row]
        //infoLabel.numberOfLines = 3;
        //infoLabel.lineBreakMode = .byWordWrapping
        //cell.infoPersons(user: displayUser, i: indexPath.row)
        return cell
    }
    
}

