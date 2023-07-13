//
//  LoginCell.swift
//  PadrinhoAmigo
//
//  Created by Larissa Okabayashi on 11/07/23.
//

import Foundation
import UIKit

class LoginCell: UITableViewCell {
    
    @IBOutlet weak var textFieldPron: UITextField!
    
    let categories = [
        "Pronome",
        "Ano que entrou",
        "Curso",
        "Local de origem",
        "Experiência",
        "Entidades",
        "Descrição"
    ]
    
    func textFieldText(i: Int, user: User){
        let str = textFieldPron.text
        if str != ""{
            if (textFieldPron.placeholder == "Pronome"){
                user.origin = str
            }
            if (textFieldPron.placeholder == "Ano que entrou"){
                user.pronouns = str //pron
            }
            if (textFieldPron.placeholder == "Curso"){
                user.entities = [str!] //entid
            }
            if (textFieldPron.placeholder == "Local de origem"){
                user.course = str
            }
            if (textFieldPron.placeholder == "Experiência"){
                user.experience = [str!]
            }
            if (textFieldPron.placeholder == "Entidades"){
                user.year = Int(str!) //ano
            }
            if (textFieldPron.placeholder == "Descrição"){
                user.description = str
            }
        }
    }
    
}
