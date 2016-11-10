//
//  SecondViewController.swift
//  JasperScholten-pset2
//
//  Created by Jasper Scholten on 07-11-16.
//  Copyright © 2016 Jasper Scholten. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var wordsLeft: UILabel!
   
    var file: String?
    var story = Story(stream: String())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        story = Story(stream: file!)
        
        if(story.getPlaceholderRemainingCount() != 0) {
            let nextPlaceholder = story.getNextPlaceholder()
            inputField.placeholder = nextPlaceholder.lowercased()
            wordsLeft.text = "\(story.getPlaceholderCount()) words left."
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func nextButton(_ sender: Any) {
        
        if (inputField.text! != "") {
            
            story.fillInPlaceholder(word: inputField.text!)

            if (story.getPlaceholderRemainingCount() > 0) {
                
                inputField.placeholder = story.getNextPlaceholder().lowercased()
                inputField.text = ""
                
                if (story.getPlaceholderRemainingCount() != 1) {
                    wordsLeft.text = "\(story.getPlaceholderRemainingCount()) words left."
                } else {
                    wordsLeft.text = "\(story.getPlaceholderRemainingCount()) word left."
                }
                
            
            } else {
                self.performSegue(withIdentifier: "ShowStory", sender: nil)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let thirdVC = segue.destination as? ThirdViewController {
            thirdVC.storyText = story.toString()
            story.clear()
        }
     }
}
