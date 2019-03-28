//
//  ViewController.swift
//  Chapter5_WhichNumberIsBigger
//
//  Created by Tanmay Bakshi on 2015-11-27.
//  Copyright © 2015 Tanmay Bakshi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var number1: UITextField!
    @IBOutlet var number2: UITextField!
    @IBOutlet var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btnSortClicked() {
        if Int(number1.text!)! > Int(number2.text!)! {
            outputLabel.text = "\(number1.text!) is greater than \(number2.text!)"
        } else if Int(number1.text!)! < Int(number2.text!)! {
            outputLabel.text = "\(number1.text!) is smaller than \(number2.text!)"
        } else {
            outputLabel.text = "\(number1.text!) is equal to \(number2.text!)"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

