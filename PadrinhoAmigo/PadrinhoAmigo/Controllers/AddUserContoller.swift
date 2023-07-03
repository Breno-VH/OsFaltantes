//
//  GetUser.swift
//  PadrinhoAmigo
//
//  Created by Breno Harris on 29/06/23.
//

import UIKit
import CloudKit

protocol TaskDelegate: AnyObject {
    func addedUser(_ record: CKRecord?, error: FetchError)
}

class AddUserController: UIViewController {
    private let name = UITextField()
    private var manager: CloudKitManager!
    weak var delegate: TaskDelegate?
    
    init(manager: CloudKitManager) {
        super.init(nibName: nil, bundle: nil)
        
        self.manager = manager
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
