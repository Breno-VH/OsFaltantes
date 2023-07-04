//
//  ComunidadeController.swift
//  PadrinhoAmigo
//
//  Created by Breno Harris on 29/06/23.
//

import UIKit
import CloudKit

class ComunidadeController: UIViewController {
    
    @IBOutlet var personList: UITableView!
    
    private let manager = CloudKitManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        personList.dataSource = self
        personList.delegate = self
        
        Task {
            await fetchRecords()
        }
    }
    
    private var users = [User]()
    private var records = [CKRecord]()
    
    func set(records: [CKRecord]) {
        self.records = records
        self.users = records.compactMap({$0.value(forKey: "name") as? User})
        
        self?.items = records.compactMap({$0.value(forKey: "name") as? String})
        self?.recordsId = records.compactMap({$0.value(forKey: "recordName") as? CKRecord})
        //self?.tableView.reloadData()
    }
    
  
    private func fetchRecords() async {
      do {
        let records = try await manager.fetch()
        print(records)
        DispatchQueue.main.async {
          self.set(records: records)
        }
      } catch {
        print(error)
      }
    }
}

extension ComunidadeController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
        //records.count
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


