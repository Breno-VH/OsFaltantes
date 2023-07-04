//
//  User.swift
//  PadrinhoAmigo
//
//  Created by Breno Harris on 29/06/23.
//

import Foundation
import UIKit
import CloudKit

class User {
    var name: String = ""
    private var ano: Int?
    private var origem: String?
    private var curso: String?
    private var interesses: [String]?
    private var entidades: [String]?
    private var experiencia: [String]?
    private var pronomes: String?
    private var descrição: String?
    private var img: UIImage?
    private var ehCalouro: Bool?
    
    init(record: CKRecord) {
        self.name = record["name"] as? String ?? ""
        self.ano = record["ano"] as? Int
        self.origem = record["origem"] as? String ?? ""
        self.curso = record["curso"] as? String ?? ""
        self.interesses = record["interesses"] as? [String] ?? []
        self.entidades = record["entidades"] as? [String] ?? [""]
        self.experiencia = record["experiencia"] as? [String] ?? []
        self.descrição = record["descrição"] as? String ?? ""
        self.pronomes = record["pronomes"] as? String ?? ""
    }
    
    init(name: String, ano: Int? = nil, origem: String? = nil, curso: String? = nil, interesses: [String]? = nil, entidades: [String]? = nil, experiencia: [String]? = nil, pronomes: String? = nil, descrição: String? = nil, img: UIImage? = nil, ehCalouro: Bool? = nil) {
        self.name = name
        self.ano = ano
        self.origem = origem
        self.curso = curso
        self.interesses = interesses
        self.entidades = entidades
        self.experiencia = experiencia
        self.pronomes = pronomes
        self.descrição = descrição
        self.img = img
        self.ehCalouro = ehCalouro
    }
    
    private var names: [String] = ["Gustavo Castro", "Amanda Kamia", "Gabriel Lima", "Lara Simas", "Bruno Tavares"]
    private var imgs: [UIImage?] = [UIImage(named: "Profile1"), UIImage(named: "Profile2"), UIImage(named: "Profile3"), UIImage(named: "Profile4"), UIImage(named: "Profile5"),]
    
    func getName(n: Int) -> String{
        return names[n]
    }
    
    func getImg(n: Int) -> UIImage?{
        return imgs[n]
    }
    
    func printName() {
        print(self.name)
    }
}

