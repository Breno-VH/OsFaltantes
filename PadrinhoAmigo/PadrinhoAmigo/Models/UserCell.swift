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
    
  
    func show(user: User, i: Int){
        
        //name.text = user.getName(n: i)
        name.text = user.name
        img.image = user.getImg(n: i)
    }
}
