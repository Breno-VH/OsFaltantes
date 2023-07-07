//
//  PerfilCell.swift
//  PadrinhoAmigo
//
//  Created by Larissa Okabayashi on 06/07/23.
//

import Foundation
import UIKit

class PerfilCell: UITableViewCell {
    
    @IBOutlet weak var rightLabel: UILabel!
    func infoPersons(user: User?, i: Int){
        let info = [
            user?.course!,
            user?.formatYear(),
            user?.origin!,
            user?.formatEntities(),
            user?.formatInterests(),
            user?.formatExperiencies(),
            user?.description!
        ]
        rightLabel.text = info[i]
    }
}
