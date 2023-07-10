//
//  PerfilController.swift
//  PadrinhoAmigo
//
//  Created by Larissa Okabayashi on 30/06/23.
//

import UIKit
class PerfilController: UIViewController {
    
    
    var displayUser: User?
    @IBOutlet weak var perfilInfo: UITableView!
    @IBOutlet weak var ForegroundView: UIView!
    @IBOutlet weak var BackgroundView: UIView!
    @IBOutlet weak var ButtonMeApadrinhe: UIButton!
    @IBOutlet weak var buttonLabel: UILabel!
    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    @IBAction func showAlert() {
          // create the alert
    
        
        let nomeUsuario = displayUser?.name ?? "esse usuário"
        
          let alert = UIAlertController(title: "", message: "Você tem certeza que quer ser apadrinhado por \(nomeUsuario)?", preferredStyle: UIAlertController.Style.alert)
          // add the actions (buttons)
          
        alert.addAction(UIAlertAction(title: "Não", style: UIAlertAction.Style.destructive, handler: nil))
        alert.addAction(UIAlertAction(title: "Sim", style: UIAlertAction.Style.default, handler: nil))
          // show the alert
          self.present(alert, animated: true, completion: nil)
        }
    
    let categories = [
    "Curso",
    "Ano que entrou",
    "Origem",
    "Entidades",
    "Interesses",
    "Experiência",
    "Descrição"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageProfile.layer.masksToBounds = false
        imageProfile.layer.borderColor = UIColor.black.cgColor
        imageProfile.layer.cornerRadius = imageProfile.frame.height/2
        imageProfile.clipsToBounds = true
        imageProfile.image = displayUser?.img
        perfilInfo.delegate = self
        perfilInfo.dataSource = self
        ButtonMeApadrinhe.configuration?.cornerStyle = .capsule
        ButtonMeApadrinhe.configuration?.background.backgroundColor = .systemCyan
        BackgroundView.clipsToBounds = true
        ForegroundView.clipsToBounds = true
        ForegroundView.layer.cornerRadius = 30
        ForegroundView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        ButtonMeApadrinhe.configuration?.background.backgroundColor = .systemGray
        ButtonMeApadrinhe.configuration?.cornerStyle = .capsule
        buttonLabel.text = "Solicitação enviada"
    }
}

extension PerfilController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categories.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        74
    }
    
    func tableView(_ tableView: UITableView, widthForRowAt indexPath: IndexPath) -> CGFloat {
        361
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PerfilCell = perfilInfo.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PerfilCell
        
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        cell.textLabel?.text = categories[indexPath.row]
        infoLabel.numberOfLines = 3;
        infoLabel.lineBreakMode = .byWordWrapping
        cell.infoPersons(user: displayUser, i: indexPath.row)
        return cell
    }
    
}











