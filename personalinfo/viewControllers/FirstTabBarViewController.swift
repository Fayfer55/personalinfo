//
//  firstTabBarViewController.swift
//  personalinfo
//
//  Created by Кирилл Файфер on 28.08.2020.
//  Copyright © 2020 Кирилл Файфер. All rights reserved.
//

import UIKit

class FirstTabBarViewController: UIViewController {
    @IBOutlet var welcomeLabel: UILabel!
    
    var  welcome: String!
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
        welcomeLabel.text = welcome 
    }
}
