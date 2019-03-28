//
//  ViewController.swift
//  factoringfactory
//
//  Created by Tanmay Bakshi on 2017-10-01.
//  Copyright © 2017 Tanmay Bakshi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var input: UITextField!
    @IBOutlet var output: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func reset() {
        input.text = ""
        output.text = "Up to First 10 Factors Will Come Here"
    }
    
    @IBAction func findFactors() {
        let numToFind = Int(input.text!)!
        var factors = ""
        var factorsFound = 0
        for i in 1...numToFind {
            let divis = numToFind % i == 0
            if divis {
                factors = "\(factors)\(i)"
                factorsFound += 1
            }
            if factorsFound == 10 {
                break
            } else if divis && i != numToFind {
                factors = "\(factors), "
            }
        }
        output.text = factors
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

