//
//  PerfilCell.swift
//  PadrinhoAmigo
//
//  Created by Larissa Okabayashi on 06/07/23.
//

import Foundation
import UIKit
import CloudKit

class PerfilCell: UITableViewCell {
    
    @IBOutlet weak var rightLabel: UILabel!
    func infoPersons(user: User?, i: Int){
        
        
        let info = [
            user?.course!,
            user?.formatYear(),
            user?.origin!,
            user?.format(array: user?.entities, sep: ", "),
            user?.format(array: user?.interests, sep: ", "),
            user?.format(array: user?.experience, sep: ", "),
            user?.description!
        ]
        rightLabel.text = info[i]
    }
}
