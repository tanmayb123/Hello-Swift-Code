//
//  ViewController.swift
//  rps
//
//  Created by Tanmay Bakshi on 2015-06-30.
//  Copyright © 2015 Tanmay Bakshi. All rights reserved.
//

import UIKit

extension UIButton {
    @objc var text: String {
        get {
            return self.titleLabel!.text!
        } set {
            self.setTitle(newValue, for: UIControlState()) //Book's code needs to be updated
        }
    }
}

class ViewController: UIViewController {

    @IBOutlet var computerLabel: UILabel!
    @IBOutlet var personLabel: UILabel!
    @IBOutlet var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func btnClicked(_ sender: UIButton) { //Book's code needs to be updated
        personLabel.text = sender.text
        computerLabel.text = type()
        if personLabel.text! == computerLabel.text! {
            outputLabel.text = "TIE! Play Again?"
            return
        }
        if checkForPlayerWin(humanType: personLabel.text!, compType: computerLabel.text!) { //Book's code needs to be updated
            outputLabel.text = "You win!"
        } else {
            outputLabel.text = "Tanmay wins!"
        }
    }
    
    @objc func type() -> String {
        let randNum = arc4random_uniform(UInt32(3))+1
        switch randNum {
        case 1:
            return "Rock"
        case 2:
            return "Paper"
        case 3:
            return "Scissors"
        default:
            return "ERROR"
        }
    }
    
    @objc func checkForPlayerWin(humanType: String, compType: String) -> Bool {
        if humanType == "Rock" {
            if compType == "Paper" {
                return false
            }
            if compType == "Scissors" {
                return true
            }
        }
        if humanType == "Paper" {
            if compType == "Scissors" {
                return false
            }
            if compType == "Rock" {
                return true
            }
        }
        if humanType == "Scissors" {
            if compType == "Rock" {
                return false
            }
            if compType == "Paper" {
                return true
            }
        }
        return false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
