//
//  ViewController.swift
//  PadrinhoAmigo
//
//  Created by Breno Harris on 28/06/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    private var comunidade: ComunidadeController!
    private let manager = CloudKitManager()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureCommunity()
        
        Task {
            await fetchRecords()
        }
    }
    
    private func configureCommunity() {
        comunidade = ComunidadeController(manager: manager)
    }
    
    private func fetchRecords() async {
        do {
            let records = try await manager.fetch()
            print(records)
            DispatchQueue.main.async {
                self.comunidade.set(records: records)
            }
        } catch {
            print(error)
        }
    }
}

