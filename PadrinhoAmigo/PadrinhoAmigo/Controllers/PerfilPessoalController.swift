//
//  PerfilPessoal.swift
//  PadrinhoAmigo
//
//  Created by Larissa Okabayashi on 11/07/23.
//

import Foundation
import UIKit

class PerfilPessoalController: UIViewController {
    
    //private var displayUser = AppState.shared.getUser()
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
    
    @IBOutlet weak var BackgroundView: UIView!
    
    @IBOutlet weak var ForegroundView: UIView!
    
    @IBOutlet weak var imageProfile: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var PronomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        perfilTableview.delegate = self
        perfilTableview.dataSource = self
        BackgroundView.clipsToBounds = true
        ForegroundView.clipsToBounds = true
        ForegroundView.layer.cornerRadius = 30
        ForegroundView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        imageProfile.layer.masksToBounds = false
        imageProfile.layer.borderColor = UIColor.black.cgColor
        imageProfile.layer.cornerRadius = imageProfile.frame.height/2
        imageProfile.clipsToBounds = true
        imageProfile.image = AppState.shared.getUser()?.img
        nameLabel.text = AppState.shared.getUser()?.name
        PronomeLabel.text = AppState.shared.getUser()?.pronouns
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
        let cell: PerfilPessoalCell = perfilTableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PerfilPessoalCell
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        cell.textLabel?.text = categories[indexPath.row]
        //infoLabel.numberOfLines = 3;
        //infoLabel.lineBreakMode = .byWordWrapping
        cell.infoPersons(user: AppState.shared.getUser(), i: indexPath.row)
        return cell
    }
    
}

