//
//  UserCell.swift
//  PadrinhoAmigo
//
//  Created by Breno Harris on 03/07/23.
//

import Foundation
import UIKit
class UserCell: UITableViewCell {
  @IBOutlet weak var name: UILabel!
  @IBOutlet weak var img: UIImageView!
  func show(user: User, i: Int){
    name.text = user.getName(n: i)
    img.image = user.getImg(n: i)
  }
}
