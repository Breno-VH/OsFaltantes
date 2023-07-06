//
//  PerfilController.swift
//  PadrinhoAmigo
//
//  Created by Larissa Okabayashi on 30/06/23.
//

import UIKit
class PerfilController: UIViewController {
   
    @IBOutlet weak var ForegroundView: UIView!
    @IBOutlet weak var BackgroundView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        BackgroundView.clipsToBounds = true
        ForegroundView.clipsToBounds = true
        ForegroundView.layer.cornerRadius = 30
        ForegroundView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
      }
}
