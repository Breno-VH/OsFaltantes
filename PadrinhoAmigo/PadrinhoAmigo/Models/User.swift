//
//  User.swift
//  PadrinhoAmigo
//
//  Created by Breno Harris on 03/07/23.
//

import Foundation
import UIKit

class User: NSObject {
    private var name: String
    private var curso: String
    private var ano: Int
    private var origem: String
    private var entidades: [String]?
    private var descricao: String?
    private var interesses: [String]?
    private var experiencias: [String]
    private var img: UIImage?
    private var ehCalouro: Bool?
    
    
    init(name: String, curso: String, ano: Int, origem: String, entidades: [String], descricao: String, interesses: [String], experiencias: [String]) {
        self.name = name
        self.curso = curso
        self.ano = ano
        self.origem = origem
        self.entidades = entidades
        self.descricao = descricao
        self.interesses = interesses
        self.experiencias = experiencias
    }
    
}
