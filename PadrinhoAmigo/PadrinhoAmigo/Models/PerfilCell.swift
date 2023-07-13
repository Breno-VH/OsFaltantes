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
    private var manager = CloudKitManager()
    @IBOutlet weak var rightLabel: UILabel!
    func infoPersons(user: User?, i: Int) async throws {
        
        
        
        
        
        let info = [
            user?.course!,
            user?.formatYear(),
            user?.origin!,
            user?.format(array: user?.entities, sep: ", "),
            user?.format(array: user?.interests, sep: ", "),
            user?.format(array: user?.experience, sep: ", "),
            user?.description!,
            user?.formatName(array: user!.godParentsName, sep: ", ")
        ]
        rightLabel.text = info[i]
    }
}

func format(array: [String?], sep: String) -> String{
    
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

