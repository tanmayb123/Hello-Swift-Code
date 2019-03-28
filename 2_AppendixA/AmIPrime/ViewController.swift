//
//  ViewController.swift
//  AmIPrime
//
//  Created by Tanmay Bakshi on 2017-09-24.
//  Copyright © 2017 Tanmay Bakshi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var inputField: UITextField!
    @IBOutlet var outputField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func processInput() {
        if inputField.text! == "2" {
            outputField.text = "Prime!"
        } else {
            let userInput = Int(inputField.text!)!
            var output = "Prime!"
            for i in 2...Int(sqrt(Double(userInput))) {
                if userInput % i == 0 {
                    output = "Composite, divisible by \(i)!"
                    break
                }
            }
            outputField.text = output
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

