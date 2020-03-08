//
//  HomeViewController.swift
//  Login
//
//  Created by Dmitry on 06.03.2020.
//  Copyright © 2020 Dmitry. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var userName: String?

    @IBOutlet var helloUser: UILabel!
    
    @IBAction func logoutTapped() {
        dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        helloUser.text = "Hello, " + userName!
    }
}
