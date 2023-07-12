//
//  LoginController.swift
//  PadrinhoAmigo
//
//  Created by Breno Harris on 11/07/23.
//

import UIKit
import CloudKit


class RegistrarPerfilController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    private let manager = CloudKitManager()
    
    //var displayUser: User?
    
    @IBOutlet weak var ImagemPerfil: UIImageView!
    
    @IBOutlet weak var registrarTable: UITableView!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var SenhaTextField: UITextField!
    
    @IBOutlet weak var ConfirmarSenhaTextField: UITextField!
    
    @IBOutlet weak var addInteresseTextField: UITextField!
    
    @IBOutlet weak var interesseButtonLabel: UILabel!
    
    @IBOutlet weak var buttonInteresse: UIButton!
    
    
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
    
    var info: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registrarTable?.delegate = self
        registrarTable?.dataSource = self
        registrarTable?.layer.cornerRadius = 14
        
        ImagemPerfil?.layer.masksToBounds = false
        ImagemPerfil?.layer.borderColor = UIColor.black.cgColor
        ImagemPerfil?.layer.cornerRadius = ImagemPerfil.frame.height/2
        ImagemPerfil?.clipsToBounds = true
        //ImagemPerfil?.image = displayUser?.img
        
        tapgasture()
      }
    
    func tapgasture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapButton))
        ImagemPerfil?.isUserInteractionEnabled = true
        ImagemPerfil?.addGestureRecognizer(tap)
    }
    
    @objc func didTapButton() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)
    }

    
    @IBAction func loginButton(_ sender: Any) {
        //if let user = fillUser() {
            let storyboard = UIStoryboard(name: "RegistrarPerfil", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "RegistrarPerfil2") as! RegistrarPerfilController
            navigationController?.pushViewController(vc, animated: false)
        //}
    }
    
    @IBAction func ProxButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "RegistrarPerfil", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "RegistrarPerfil3") as! RegistrarPerfilController
        navigationController?.pushViewController(vc, animated: false)
        registrarTable.reloadData()
    }
    
    @IBAction func plusButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "RegistrarPerfil", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "interesse") as! RegistrarPerfilController
        navigationController?.pushViewController(vc, animated: false)
    }
    
    @IBAction func salvarButton(_ sender: Any) {
        Task {
            await saveUser(user: fillUser()!)
        }
    }
    
    @IBAction func addButton(_ sender: Any) {
        addInteresseTextField.isHidden = true
        //buttonInteresse.titleLabel?.text = addInteresseTextField.text
        interesseButtonLabel.text = addInteresseTextField.text
    }
    
    func saveUser(user: User) async {
        manager.save(user: user)
    }
    
    func fillUser() -> User? {
        
        if SenhaTextField.text! != ConfirmarSenhaTextField.text! {
            print("senhas não são iguais")
            return nil
        } else if !validateEmail(email: emailTextField.text!) {
            print("formato invalido de email")
            return nil
        }
        var registeredUser = User(email: emailTextField.text!, password: SenhaTextField.text!, name: nameTextField.text!, pronouns: info[0], year: info[1], course: info[2], origin: info[3], experience: info[4], interest: info[5], entities: info[6], description: info[7])
        
        return registeredUser
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

extension RegistrarPerfilController: UITableViewDataSource, UITableViewDelegate {
    
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
        info.append(cell.textFieldText())
        return cell
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        ImagemPerfil.image = info[.originalImage] as? UIImage
        dismiss(animated: true, completion: nil)
    }
    
}

