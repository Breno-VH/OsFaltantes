//
//  User.swift
//  PadrinhoAmigo
//
//  Created by Breno Harris on 29/06/23.
//

import CloudKit
import UIKit

class UserModel: UITableViewCell {
    
    static let reuseID = "TaskCell"
    
    private var record: CKRecord?
    private var name = UILabel(frame: .zero)
    
    
    
    
    //weak var delegate: TaskCheckDelegate?
 
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
 
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func prepareForReuse() {
        self.record = nil
    }
     
    
    func set(record: CKRecord) {
        self.record = record
        
        name.text = record.object(forKey: "name") as? String ?? ""
        /*
        if let createdDate = record.object(forKey: "createdAt") as? Date {
            createdAtLabel.text = createdDate.formatted(.dateTime)
        } else {
            createdAtLabel.text = ""
        }
        */
    }
    
}
