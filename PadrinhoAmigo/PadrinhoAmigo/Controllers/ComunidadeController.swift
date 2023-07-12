//
//  ComunidadeController.swift
//  PadrinhoAmigo
//
//  Created by Breno Harris on 29/06/23.
//

import UIKit
import CloudKit

class ComunidadeController: UIViewController {
    var loggedUser = AppState.shared.loggedUser
    
    @IBOutlet var personList: UITableView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    private var showFreshmen: Bool = true
    private var numberOfFreshmen: Int = 0
    private var numberOfSeniors: Int = 0
    private let manager = CloudKitManager()
    let loadingTextLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        spinner.startAnimating()
        
    
        
        personList.dataSource = self
        personList.delegate = self
        personList.layer.cornerRadius = 14
        
        Task {
            await fetchRecords()
        }
    }
    
    private var users = [User]()
    private var records = [CKRecord]()
    
    func set(records: [CKRecord]) {
        self.records = records
        self.users = records.compactMap({User(record: $0)})
        spinner.isHidden = true
        count()
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
    
    @IBAction func segmentedControlChange(_ sender: Any) {
        if (segmentedControl.selectedSegmentIndex == 1){
            showFreshmen = false
            personList.reloadData()
        }
    }
    
    func count(){
        for user in users{
            if user.isFreshmen == true{
                numberOfFreshmen += 1
            }
            else{
                numberOfSeniors += 1
            }
        }
    }
    
}

extension ComunidadeController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //count()
        if (showFreshmen == true){
            return numberOfFreshmen
        }
        else{
            return numberOfSeniors
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        128
    }
    
    func tableView(_ tableView: UITableView, widthForRowAt indexPath: IndexPath) -> CGFloat {
        374
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       personList.deselectRow(at: indexPath, animated: true)
       let user = users[indexPath.row]
       
       let storyboard = UIStoryboard(name: "Main", bundle: nil)
       let vc = storyboard.instantiateViewController(withIdentifier: "PersonProfile") as! PerfilController
         vc.displayUser = user
       navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UserCell = personList.dequeueReusableCell(withIdentifier: "person1", for: indexPath) as! UserCell
        cell.show(user: users[indexPath.row])
        return cell
    }
}


