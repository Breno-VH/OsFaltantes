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
    var godParents: [CKRecord]?
    var godChildren: [CKRecord]?
    var password: String?
    var isFreshmen: Bool {
        let currentYear = Calendar(identifier: .gregorian).dateComponents([.year], from: .now).year! % 2000
        
        if year == currentYear {
            return true
        }
        return false
    }
    
    init(record: CKRecord) {
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
        self.godParents = record["padrinhos"] as? [CKRecord] ?? []
        self.godChildren = record["afilhados"] as? [CKRecord] ?? []
        
        
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
}
