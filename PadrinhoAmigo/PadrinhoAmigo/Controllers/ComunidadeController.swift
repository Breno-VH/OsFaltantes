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
        self.users = records.compactMap({User(record: $0)})
        
        self.personList.reloadData()
    }
    
  
    private func fetchRecords() async {
      do {
        let records = try await manager.fetch()
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
        
        records.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        128
    }
    
    func tableView(_ tableView: UITableView, widthForRowAt indexPath: IndexPath) -> CGFloat {
        374
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UserCell = personList.dequeueReusableCell(withIdentifier: "person1", for: indexPath) as! UserCell
        
        cell.layer.cornerRadius = 8
        cell.layer.masksToBounds = true

        cell.layer.masksToBounds = false
        cell.layer.shadowOffset = CGSizeMake(0, 0)
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOpacity = 0.23
        cell.layer.shadowRadius = 4
        
        cell.show(user: User(), i: indexPath.row)
        
        return cell
    }
    
}


