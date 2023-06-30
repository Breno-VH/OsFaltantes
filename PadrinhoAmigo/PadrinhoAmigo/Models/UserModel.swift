//
//  User.swift
//  PadrinhoAmigo
//
//  Created by Breno Harris on 29/06/23.
//

import Foundation

class UserModel {
    private var name: String
    private var year: String
    private var origin: String
    private var course: String
    private var interests: [String]?
    private var entities: [String]?
    private var experience: [String]?
    private var pronouns: String?
    private var description: String?
    
    weak var delegate: UserDelegate?
    
    init(name: String, year: String, origin: String, course: String, interests: [String]? = nil, entities: [String]? = nil, experience: [String]? = nil, pronouns: String? = nil, description: String? = nil) {
        self.name = name
        self.year = year
        self.origin = origin
        self.course = course
        self.interests = interests
        self.entities = entities
        self.experience = experience
        self.pronouns = pronouns
        self.description = description
    }
    
    @objc func requestData() {
        
        delegate?.didRecieveDataUpdate(data: data)
    }
    
}
