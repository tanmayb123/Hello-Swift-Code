//
//  ViewController.swift
//  Chapter5_MysteryOfEnteredNumber
//
//  Created by Tanmay Bakshi on 2015-11-27.
//  Copyright © 2015 Tanmay Bakshi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var inputField: UITextField!
    @IBOutlet var outputField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func btnCheckClicked() {
        var userInput: Int = Int(inputField.text!)!
        switch userInput {
        case 1:
            outputField.text = "You entered One, didn't you?"
        case 2:
            outputField.text = "You entered Two, didn't you?"
        case 3:
            outputField.text = "You entered Three, didn't you?"
        case 4:
            outputField.text = "You entered Four, didn't you?"
        default:
            outputField.text = "Uh-Oh, you did not enter 1, 2, 3 or 4!"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}