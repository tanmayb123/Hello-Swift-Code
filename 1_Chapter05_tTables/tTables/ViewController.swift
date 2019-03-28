//
//  ViewController.swift
//  tTables
//
//  Created by Tanmay Bakshi on 2015-11-28.
//  Copyright © 2015 Tanmay Bakshi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var numOne: UILabel!
    @IBOutlet var numTwo: UILabel!
    @IBOutlet var userAns: UITextField!
    @IBOutlet var lblCorrect: UILabel!
    @IBOutlet var lblWrong: UILabel!
    @IBOutlet var lblQA: UILabel!
    @IBOutlet var startButton: UIButton!
    
    var correct:Int = 0
    var wrong:Int = 0
    var QA:Int = 0
    var num1:Int = 0
    var num2:Int = 0
    var numUser:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func startClicked() {
        num1 = Int(arc4random() % 12) + 1
        num2 = Int(arc4random() % 12) + 1
        numOne.text = "\(num1)"
        numTwo.text = "\(num2)"
        startButton.isEnabled = false
    }
    
    @IBAction func checkAnswer() {
        numUser = Int(userAns.text!)!
        var realAns:Int = num1 * num2
        if numUser == realAns {
            correct += 1
            lblCorrect.text = "\(correct)"
            QA += 1
            lblQA.text = "\(QA)"
            userAns.text = ""
            num1 = Int(arc4random() % 12) + 1
            num2 = Int(arc4random() % 12) + 1
            numOne.text = "\(num1)"
            numTwo.text = "\(num2)"
        } else {
            wrong += 1
            lblWrong.text = "\(wrong)"
            QA += 1
            lblQA.text = "\(QA)"
            userAns.text = ""
            num1 = Int(arc4random() % 12) + 1
            num2 = Int(arc4random() % 12) + 1
            numOne.text = "\(num1)"
            numTwo.text = "\(num2)"
        }
    }
    
    @IBAction func stopClicked() {
        correct = 0
        wrong = 0
        QA = 0
        num1 = 0
        num2 = 0
        numUser = 0
        lblCorrect.text = "0"
        lblWrong.text = "0"
        lblQA.text = "0"
        numOne.text = "0"
        numTwo.text = "0"
        userAns.text = ""
        startButton.isEnabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

