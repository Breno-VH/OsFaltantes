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
    private var manager = CloudKitManager()
    
    var name: String = ""
    var year: Int?
    var origin: String?
    var course: String?
    var interests: [String]?
    var entities: [String]?
    var experience: [String]?
    var pronouns: String?
    var description: String?
    var img: UIImage?
    var record: CKRecord?
    var godParents: [CKRecord.ID]?
    var godChildren: [CKRecord.ID]?
    var email: String?
    var password: String?
    var godParentsName = [String]()
    var isFreshmen: Bool {
        if year == 23 {
            return true
        }
        return false
    }
    
    init(email: String, password: String, name: String, pronouns: String, year: String, course: String, origin: String, experience: String, interest: String, entities: String, description: String) {
        self.email = email
        self.password = password
        self.name = name
        self.pronouns = pronouns
        self.year = Int(year)
        self.course = course
        self.origin = origin
        self.experience = [experience]
        self.interests = [interest]
        self.entities = [entities]
        self.description = description
    }
    
    init(record: CKRecord) {
        var afilhados: [CKRecord.Reference]
        var padrinhos: [CKRecord.Reference]
        
        self.record = record
        self.name = record["name"] as? String ?? ""
        self.year = record["ano"] as? Int
        self.origin = record["origem"] as? String ?? ""
        self.course = record["curso"] as? String ?? ""
        self.interests = record["interesses"] as? [String] ?? []
        self.entities = record["entidades"] as? [String] ?? [""]
        self.experience = record["experiencia"] as? [String] ?? []
        self.description = record["descricao"] as? String ?? ""
        self.pronouns = record["pronomes"] as? String ?? ""
        padrinhos = record["padrinhos"] as? [CKRecord.Reference] ?? []
        afilhados = record["afilhados"] as? [CKRecord.Reference] ?? []
        self.godParents = padrinhos.map( { $0.recordID } )
        self.godChildren = afilhados.map( { $0.recordID } )
        
        Task {
            var ehCalouro = self.isFreshmen
            var nameParents = [CKRecord.ID]()
            if ehCalouro {
                nameParents = self.godParents ?? []
            } else {
                nameParents = self.godChildren ?? []
            }
            
            godParentsName = try await nameParents.asyncMap( { id in
                try await manager.fetchUserNameGivenID(id: id) ?? ""
            } )
        }
        
        
        
        let imageAsset = record["imagem"] as? CKAsset
        let imageUrl = imageAsset?.fileURL
        
        if let url = imageUrl, let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
            
            img = image
            img = self.resizeImage(image: img!, targetSize: CGSizeMake(90, 90))
               
        }
    }
    
}

extension User {
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? {
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: targetSize.width, height: targetSize.height)
        } else {
            newSize = CGSize(width: targetSize.width, height: targetSize.height)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    func format(array: [String]?, sep: String) -> String{
        var formattedString: String = ""
        for i in array!{
            formattedString += i
            if (i != array![array!.count-1]){
                formattedString += sep
            }
        }
        return formattedString
    }
    
    func formatYear() -> String{
        return "0" + String(self.year!)
    }
    
    
    func formatName(array: [String?], sep: String) -> String{
        
        var formattedString: String = ""
        for i in array{
            if let str = i {
                formattedString += str
                if (str != array[array.count-1]){
                    formattedString += sep
                }
            }
            
        }
        return formattedString
    }
}


extension Sequence {
    func asyncMap<T>(
        _ transform: (Element) async throws -> T
    ) async rethrows -> [T] {
        var values = [T]()

        for element in self {
            try await values.append(transform(element))
        }

        return values
    }
}



