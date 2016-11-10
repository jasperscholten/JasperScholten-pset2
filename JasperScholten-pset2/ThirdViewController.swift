//
//  ThirdViewController.swift
//  JasperScholten-pset2
//
//  Created by Jasper Scholten on 08-11-16.
//  Copyright © 2016 Jasper Scholten. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var storyField: UITextView!
    
    var storyText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storyField.text = storyText!
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}
