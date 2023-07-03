//
//  ComunidadeController.swift
//  PadrinhoAmigo
//
//  Created by Breno Harris on 29/06/23.
//

import UIKit
import CloudKit

class ComunidadeController: UITableViewController {
    
    private var manager: CloudKitManager
    private var users = [User]()
    private var records = [CKRecord]()
    
    init(manager: CloudKitManager) {
        self.manager = manager
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    func set(records: [CKRecord]) {
        self.records = records
        //tableView.reloadData()
    }
}

extension ComunidadeController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return records.count
        }
        
        
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: User.name, for: indexPath) as! User
        cell.set(record: records[indexPath.row])
        
        return cell
    }
    
}
