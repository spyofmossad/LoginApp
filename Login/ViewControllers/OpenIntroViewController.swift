//
//  OpenIntroViewController.swift
//  Login
//
//  Created by Dmitry on 07.03.2020.
//  Copyright © 2020 Dmitry. All rights reserved.
//

import UIKit

class OpenIntroViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}
