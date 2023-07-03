//
//  ComunidadeController.swift
//  PadrinhoAmigo
//
//  Created by Breno Harris on 29/06/23.
//

import UIKit
import CloudKit

class ComunidadeController:  UIViewController{
    
    @IBOutlet var personList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        personList.dataSource = self
        personList.delegate = self
    }
    
    private var manager: CloudKitManager
    private var users = [User]()
    private var records = [CKRecord]()
    
    init(manager: CloudKitManager) {
        self.manager = manager
        super.init()
      }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(records: [CKRecord]) {
        self.records = records
        //tableView.reloadData()
    }
}

extension ComunidadeController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        128
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UserCell = personList.dequeueReusableCell(withIdentifier: "person1", for: indexPath) as! UserCell
        
        cell.show(user: User(), i: indexPath.row)
        
        return cell
    }
    
}


