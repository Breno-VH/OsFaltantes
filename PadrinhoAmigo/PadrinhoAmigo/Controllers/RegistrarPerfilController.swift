//
//  LoginController.swift
//  PadrinhoAmigo
//
//  Created by Breno Harris on 11/07/23.
//

import UIKit
import CloudKit

var user: User = User(email: "", password: "", name: "", pronouns: "", year: "", course: "", origin: "", experience: "", interest: "", entities: "", description: "")

class RegistrarPerfilController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate, UITextFieldDelegate {
    
    private let manager = CloudKitManager()
    
    @IBOutlet weak var nameRegistrar: UILabel!
    
    @IBOutlet weak var ImagemPerfil: UIImageView!
    
    @IBOutlet weak var registrarTable: UITableView!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var SenhaTextField: UITextField!
    
    @IBOutlet weak var ConfirmarSenhaTextField: UITextField!
    
    @IBOutlet weak var addInteresseTextField: UITextField!
    
    @IBOutlet weak var interesseButtonLabel: UILabel!
    
    @IBOutlet weak var buttonInteresse: UIButton!
    
    @IBOutlet weak var ButtonEJ: UIButton!
    
    @IBOutlet weak var ButtonIc: UIButton!

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
        "Entidades",
        "Descrição"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registrarTable?.delegate = self
        registrarTable?.dataSource = self
        registrarTable?.layer.cornerRadius = 14
        ImagemPerfil?.layer.masksToBounds = false
        ImagemPerfil?.layer.borderColor = UIColor.black.cgColor
        ImagemPerfil?.layer.cornerRadius = ImagemPerfil.frame.height/2
        ImagemPerfil?.clipsToBounds = true
        //rConfirmarSenhaTextField.isSecureTextEntry = true
        //ImagemPerfil?.image = displayUser?.img
        self.nameTextField?.delegate = self
        self.emailTextField?.delegate = self
        self.SenhaTextField?.delegate = self
        self.ConfirmarSenhaTextField?.delegate = self
        self.addInteresseTextField?.delegate = self
        
        
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
        user.email = emailTextField.text!
        user.password = SenhaTextField.text!
        user.name = nameTextField.text!
        AppState.shared.isLoginPressed.toggle()
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
        let storyboard = UIStoryboard(name: "Perfil", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Profile") as! PerfilPessoalController
        AppState.shared.setUser(user: user)
        navigationController?.pushViewController(vc, animated: false)
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
        
        /*if SenhaTextField.text! != ConfirmarSenhaTextField.text! {
            print("senhas não são iguais")
            return nil
        } else if !validateEmail(email: emailTextField.text!) {
            print("formato invalido de email")
            return nil
        }*/
        let registeredUser = user
        
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
    
    
    @IBAction func ButtonEJ(_ sender: UIButton) {
        user.interests! += ["Empresa Júnior"]
        ButtonPressedHighlight(sender, button: ButtonEJ)
        ButtonEJ.layer.cornerRadius = 8
    }
    
    @IBAction func ButtonIc(_ sender: UIButton) {
        user.interests! += ["Iniciação científica"]
        ButtonPressedHighlight(sender, button: ButtonIc)
        ButtonIc.layer.cornerRadius = 8
    }
    
    @IBAction func ButtonTv(_ sender: UIButton) {
        user.interests! += ["Trabalho Voluntário"]
        ButtonPressedHighlight(sender, button: ButtonTv)
        ButtonTv.layer.cornerRadius = 8
    }
    
    @IBAction func ButtonMs(_ sender: UIButton) {
        user.interests! += ["Movimento Social"]
        ButtonPressedHighlight(sender, button: ButtonMs)
        ButtonMs.layer.cornerRadius = 8
    }
    
    
    @IBAction func ButtonIntercambio(_ sender: UIButton) {
        user.interests! += ["Intercâmbio"]
        ButtonPressedHighlight(sender, button: ButtonIntercambio)
        ButtonIntercambio.layer.cornerRadius = 8
    }
    
    
    @IBAction func ButtonDancas(_ sender: UIButton) {
        user.interests! += ["Danças"]
        ButtonPressedHighlight(sender, button: ButtonDancas)
        ButtonDancas.layer.cornerRadius = 8
    }
    
    @IBAction func ButtonRobotica(_ sender: UIButton) {
        user.interests! += ["Robótica"]
        ButtonPressedHighlight(sender, button: ButtonRobotica)
        ButtonRobotica.layer.cornerRadius = 8
    }
    
   
    
    @IBAction func ButtonEsportes(_ sender: UIButton) {
        user.interests! += ["Esportes"]
        ButtonPressedHighlight(sender, button: ButtonEsportes)
        ButtonEsportes.layer.cornerRadius = 8
    }
    
    
    @IBAction func ButtonBateria(_ sender: UIButton) {
        user.interests = ["Bateria"]
        ButtonPressedHighlight(sender, button: ButtonBateria)
        ButtonBateria.layer.cornerRadius = 8
    }
    
    
    
    @IBAction func ButtonGe(_ sender: UIButton) {
        user.interests = ["Grupo de Estudos"]
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

extension RegistrarPerfilController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        nameRegistrar.text = user.name
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        44
    }
    
    func tableView(_ tableView: UITableView, widthForRowAt indexPath: IndexPath) -> CGFloat {
        361
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: LoginCell = registrarTable.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! LoginCell
        cell.textFieldPron.placeholder = categories[indexPath.row]
        if (AppState.shared.isLoginPressed){
            cell.textFieldText(i: indexPath.row, user: user)
        }
        return cell
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        ImagemPerfil.image = info[.originalImage] as? UIImage
        user.img = info[.originalImage] as? UIImage
        dismiss(animated: true, completion: nil)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return emailTextField.resignFirstResponder()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

