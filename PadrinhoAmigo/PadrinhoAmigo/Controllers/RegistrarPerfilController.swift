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
    
    @IBOutlet weak var addInteresseTextField: UITextField!
    
    @IBOutlet weak var interesseButtonLabel: UILabel!
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var buttonInteresse: UIButton!
    
    @IBOutlet weak var ButtonEJ: UIButton!
    
    @IBOutlet weak var ButtonIC: UIButton!
    
    @IBOutlet weak var ButtonTv: UIButton!
    
    @IBOutlet weak var ButtonMs: UIButton!
    
    @IBOutlet weak var ButtonIntercambio: UIButton!
    
    @IBOutlet weak var ButtonDancas: UIButton!
    
    @IBOutlet weak var ButtonRobotica: UIButton!
    
    @IBOutlet weak var ButtonEsportes: UIButton!
    
    @IBOutlet weak var ButtonBateria: UIButton!
    
    @IBOutlet weak var ButtonGe: UIButton!
    
    
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
    }
    
    @IBAction func plusButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "RegistrarPerfil", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "interesse") as! RegistrarPerfilController
        navigationController?.pushViewController(vc, animated: false)
    }
    
    @IBAction func salvarButton(_ sender: Any) {
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
        var registeredUser = User(email: emailTextField.text!, password: SenhaTextField.text!, name: nameTextField.text!)
        
        return registeredUser
    }
    
    func ButtonPressedHighlight(_ sender: UIButton, button : UIButton) {
        sender.backgroundColor = sender.backgroundColor == UIColor.systemCyan ? UIColor.systemGray6 : UIColor.systemCyan
        if sender.backgroundColor == UIColor.systemCyan {
            sender.configuration?.baseForegroundColor = .white
        } else {
            sender.configuration?.baseForegroundColor = .black
        }
    }
    
    @IBAction func ButtonEJPressed(_ sender: UIButton) {
        ButtonPressedHighlight(sender, button: ButtonEJ)
        ButtonEJ.layer.cornerRadius = 8
    }
    
    @IBAction func ButtonIC(_ sender: UIButton) {
        ButtonPressedHighlight(sender, button: ButtonIC)
        ButtonIC.layer.cornerRadius = 8
    }
    
    @IBAction func ButtonTv(_ sender: UIButton) {
        ButtonPressedHighlight(sender, button: ButtonTv)
        ButtonTv.layer.cornerRadius = 8
    }
    
    @IBAction func ButtonMs(_ sender: UIButton) {
        ButtonPressedHighlight(sender, button: ButtonMs)
        ButtonMs.layer.cornerRadius = 8
    }
    
    @IBAction func ButtonIntercambio(_ sender: UIButton) {
        ButtonPressedHighlight(sender, button: ButtonIntercambio)
        ButtonIntercambio.layer.cornerRadius = 8
    }
    
    @IBAction func ButtonDancas(_ sender: UIButton) {
        ButtonPressedHighlight(sender, button: ButtonDancas)
        ButtonDancas.layer.cornerRadius = 8
    }
    
    @IBAction func ButtonRobotica(_ sender: UIButton) {
        ButtonPressedHighlight(sender, button: ButtonRobotica)
        ButtonRobotica.layer.cornerRadius = 8
    }
    
    @IBAction func ButtonEsportes(_ sender: UIButton) {
        ButtonPressedHighlight(sender, button: ButtonEsportes)
        ButtonEsportes.layer.cornerRadius = 8
    }
    
    @IBAction func ButtonBateria(_ sender: UIButton) {
        ButtonPressedHighlight(sender, button: ButtonBateria)
        ButtonBateria.layer.cornerRadius = 8
    }
    
    @IBAction func ButtonGe(_ sender: UIButton) {
        ButtonPressedHighlight(sender, button: ButtonGe)
        ButtonGe.layer.cornerRadius = 8
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
    

