//
//  ViewController.swift
//  Dice
//
//  Created by Tanmay Bakshi on 2015-07-01.
//  Copyright © 2015 Tanmay Bakshi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var diceOne: UILabel!
    @IBOutlet var diceTwo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func simulateDie() {
        diceOne.text = "\(randDice())"
        diceTwo.text = "\(randDice())"
    }
    
    @objc func randDice() -> Int {
        return Int(arc4random_uniform(UInt32(6))+1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

