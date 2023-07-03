//
//  User.swift
//  PadrinhoAmigo
//
//  Created by Breno Harris on 29/06/23.
//

import Foundation
import UIKit

class User {
    private var name: String = ""
    private var ano: String?
    private var origem: String?
    private var curso: String?
    private var interesses: [String]?
    private var entidades: [String]?
    private var experiencia: [String]?
    private var pronomes: String?
    private var descrição: String?
    private var img: UIImage?
    private var ehCalouro: Bool?
    
    private var names: [String] = ["Gustavo Castro", "Amanda Kamia", "Gabriel Lima", "Lara Simas", "Bruno Tavares"]
    private var imgs: [UIImage?] = [UIImage(named: "Profile1"), UIImage(named: "Profile2"), UIImage(named: "Profile3"), UIImage(named: "Profile4"), UIImage(named: "Profile5"),]
    
    func getName(n: Int) -> String{
        return names[n]
    }
    
    func getImg(n: Int) -> UIImage?{
        return imgs[n]
    }
    
}
