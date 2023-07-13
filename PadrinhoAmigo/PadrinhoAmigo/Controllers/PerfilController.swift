//
//  PerfilController.swift
//  PadrinhoAmigo
//
//  Created by Larissa Okabayashi on 30/06/23.
//

import UIKit
import CloudKit
class PerfilController: UIViewController {
    
    var manager = CloudKitManager()
    var displayUser: User?
    var loggedUser = AppState.shared.loggedUser
    @IBOutlet weak var perfilInfo: UITableView!
    @IBOutlet weak var ForegroundView: UIView!
    @IBOutlet weak var BackgroundView: UIView!
    @IBOutlet weak var ButtonMeApadrinhe: UIButton!
    @IBOutlet weak var buttonLabel: UILabel!
    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pronounsLabel: UILabel!
    @IBAction func showAlert() {
          // create the alert
    
        
        let nomeUsuario = displayUser?.name ?? "esse usuário"
        
          let alert = UIAlertController(title: "", message: "Você tem certeza que quer ser apadrinhado por \(nomeUsuario)?", preferredStyle: UIAlertController.Style.alert)
          // add the actions (buttons)
          
        alert.addAction(UIAlertAction(title: "Não", style: UIAlertAction.Style.destructive, handler: nil))
        
        alert.addAction(
            UIAlertAction(title: "Sim", style: .default, handler: { _ in
                self.didTapYesOption()
                self.updateGodFather()
                
            })
        )
        
          // show the alert
          self.present(alert, animated: true, completion: nil)
        }
    
    var categories = [
    "Curso",
    "Ano que entrou",
    "Origem",
    "Entidades",
    "Interesses",
    "Experiência",
    "Descrição"
    ]
    
    
    func didTapYesOption() {
        ButtonMeApadrinhe.configuration?.background.backgroundColor = .systemGray
        ButtonMeApadrinhe.configuration?.cornerStyle = .capsule
        buttonLabel.text = "Solicitação enviada"
        ButtonMeApadrinhe.isEnabled = false
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if displayUser!.isFreshmen {
            categories.append("Padrinhos")
        } else {
            categories.append("Afilhados")
        }
        print(user.godChildren)
        
        
        imageProfile.layer.masksToBounds = false
        imageProfile.layer.borderColor = UIColor.black.cgColor
        imageProfile.layer.cornerRadius = imageProfile.frame.height/2
        imageProfile.clipsToBounds = true
        imageProfile.image = displayUser?.img
        nameLabel.text = displayUser?.name
        pronounsLabel.text = displayUser?.pronouns
        perfilInfo.delegate = self
        perfilInfo.dataSource = self
        //perfilInfo.clipsToBounds = true
        perfilInfo.layer.cornerRadius = 14
        //perfilInfo.layer.masksToBounds = true
        ButtonMeApadrinhe.configuration?.cornerStyle = .capsule
        ButtonMeApadrinhe.configuration?.background.backgroundColor = .systemCyan
        BackgroundView?.clipsToBounds = true
        ForegroundView?.clipsToBounds = true
        ForegroundView?.layer.cornerRadius = 30
        ForegroundView?.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
       //
    }
}

extension PerfilController: UITableViewDataSource, UITableViewDelegate{
    
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
        let cell: PerfilCell = perfilInfo.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PerfilCell
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        cell.textLabel?.text = categories[indexPath.row]
        infoLabel.numberOfLines = 3;
        infoLabel.lineBreakMode = .byWordWrapping
        cell.rightLabel.numberOfLines = 3
        cell.rightLabel.lineBreakMode =  .byWordWrapping
        Task {
            try await cell.infoPersons(user: displayUser, i: indexPath.row)
        }
        return cell
    }
    
    
    func updateGodFather() {
        print("vamos atualizar a relacao de \(loggedUser?.name) e \(displayUser?.name)")
        var podeApadrinhar = true
        
        if loggedUser == nil {
            podeApadrinhar = false
        }
        
        loggedUser?.godParents?.forEach({
            godParent in
            if displayUser?.record?.recordID == godParent {
                podeApadrinhar = false
            }
        })
        
        if podeApadrinhar {
            manager.updateParentsList(godSon: loggedUser!, godParent: displayUser!)
        }
        
    }
    
}











