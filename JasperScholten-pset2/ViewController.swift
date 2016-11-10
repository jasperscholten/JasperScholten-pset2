//
//  ViewController.swift
//  JasperScholten-pset2
//
//  Created by Jasper Scholten on 07-11-16.
//  Copyright © 2016 Jasper Scholten. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var contents = String()
        
        if let secondVC = segue.destination as? SecondViewController {
            
            // load random story
            let stories = ["madlib0_simple", "madlib1_tarzan", "madlib2_university", "madlib3_clothes", "madlib4_dance"]
            let random = Int(arc4random_uniform(UInt32(stories.count)))
            
            // Method to get story from txt file retrieved from https://www.hackingwithswift.com/example-code/strings/how-to-load-a-string-from-a-file-in-your-bundle
            if let filepath = Bundle.main.path(forResource: stories[random], ofType: "txt") {
                do {
                    contents = try String(contentsOfFile: filepath)
                } catch {
                    print("contents could not be loaded")
                }
            } else {
                print("example.txt not found!")
            }
            
            secondVC.file = contents
        }
    }
    
}

