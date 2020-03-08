//
//  ProfessionViewController.swift
//  Login
//
//  Created by Dmitry on 07.03.2020.
//  Copyright © 2020 Dmitry. All rights reserved.
//

import UIKit

class ProfessionViewController: UIViewController  {
    
    @IBOutlet var tapHere: UITextView!
    
    override func viewDidLoad() {
        let attributedString = NSMutableAttributedString(string: "Want more? Tap here")
        attributedString.addAttribute(
            .link,
            value: "https://www.linkedin.com/in/dmitry-navitski-3b30317a/",
            range: (tapHere.text as NSString).range(of: "Tap here")
        )

        tapHere.attributedText = attributedString
    }
}
