//
//  ComunidadeController.swift
//  PadrinhoAmigo
//
//  Created by Breno Harris on 29/06/23.
//

import UIKit

class ComunidadeController: UIViewController, UserDelegate {
    
    
    func didRecieveDataUpdate(data: UserModel) {
        data.delegate? = self
    }
    
    
    @IBOutlet weak var personList: UITableView!
    
    
    @IBOutlet weak var title: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}
