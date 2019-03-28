//
//  ViewController.swift
//  GoldSilverBronze
//
//  Created by Tanmay Bakshi on 2015-11-28.
//  Copyright © 2015 Tanmay Bakshi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var text1: UITextField!
    @IBOutlet var text2: UITextField!
    @IBOutlet var text3: UITextField!
    
    @IBOutlet var output1: UILabel!
    @IBOutlet var output2: UILabel!
    @IBOutlet var output3: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btnClicked() {
        var a = Int(text1.text!)!
        var b = Int(text2.text!)!
        var c = Int(text3.text!)!
        var num1 = 0
        var num2 = 0
        var num3 = 0
        if a < b {
            if a < c {
                if b < c {
                    num1 = a
                    num2 = b
                    num3 = c
                } else {
                    num1 = a
                    num2 = c
                    num3 = b
                }
            } else {
                num1 = c
                num2 = a
                num3 = b
            }
        } else {
            if b < c {
                if a < c {
                    num1 = b
                    num2 = a
                    num3 = c
                } else {
                    num1 = b
                    num2 = c
                    num3 = a
                }
            } else {
                num1 = c
                num2 = b
                num3 = a
            }
        }
        output1.text = "\(num3)"
        output2.text = "\(num2)"
        output3.text = "\(num1)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

