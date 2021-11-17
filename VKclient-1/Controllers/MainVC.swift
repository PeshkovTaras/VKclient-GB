//
//  MainVC.swift
//  VKclient-1
//
//  Created by Тарас Пешков on 06.11.2021.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let session = Session.instance
        let userName = session.userName.description
        mainLabel.text = "Добро пожаловать, \(userName)!"
    }
}
