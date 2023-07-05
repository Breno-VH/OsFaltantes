//
//  UserCell.swift
//  PadrinhoAmigo
//
//  Created by Larissa Okabayashi on 03/07/23.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var course: UILabel!
    
    @IBOutlet weak var year: UILabel!
    
    @IBOutlet weak var interests: UILabel!
    
    func show(user: User){
        
        //name.text = user.getName(n: i)
        name.text = user.name
        img.image = user.img
        
        img.layer.borderWidth = 1
        img.layer.masksToBounds = false
        img.layer.borderColor = UIColor.black.cgColor
        img.layer.cornerRadius = img.frame.height/2
        img.clipsToBounds = true
        course.text = user.course
        year.text = "0" + String(user.year!)
        interests.text = format(interests: user.interests!)
        
        
    }
    
    func format(interests: [String]) -> String{
        var interestsString: String = ""
        for i in interests{
            interestsString += i
            if (i != interests[interests.count-1]){
                interestsString += " - "
            }
        }
        return interestsString
    }
}
