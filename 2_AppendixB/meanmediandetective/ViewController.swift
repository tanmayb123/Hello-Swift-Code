//
//  ViewController.swift
//  meanmediandetective
//
//  Created by Tanmay Bakshi on 2017-09-24.
//  Copyright © 2017 Tanmay Bakshi. All rights reserved.
//

import UIKit

extension UITextField {
    var decimalValue: Double? {
        return Double(self.text!)
    }
}

class ViewController: UIViewController {
    
    @IBOutlet var input1: UITextField!
    @IBOutlet var input2: UITextField!
    @IBOutlet var input3: UITextField!
    @IBOutlet var input4: UITextField!
    @IBOutlet var input5: UITextField!
    @IBOutlet var input6: UITextField!
    @IBOutlet var input7: UITextField!
    @IBOutlet var input8: UITextField!
    @IBOutlet var input9: UITextField!
    @IBOutlet var input10: UITextField!
    
    @IBOutlet var medianLabel: UILabel!
    @IBOutlet var meanLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func median(arr: [Double]) -> Double {
        let sortedArr = arr.sorted()
        if sortedArr.count % 2 == 0 {
            return mean(arr: [sortedArr[sortedArr.count / 2], sortedArr[sortedArr.count / 2 - 1]])
        }
        return sortedArr[sortedArr.count / 2]
    }
    
    func mean(arr: [Double]) -> Double {
        var totalValue = 0.0
        for i in arr {
            totalValue += i
        }
        return totalValue / Double(arr.count)
    }
    
    @IBAction func meanMedianCalculator() {
        let inputTextfields = [input1, input2, input3, input4, input5, input6, input7, input8, input9, input10]
        var input: [Double] = []
        for i in inputTextfields {
            if i!.decimalValue != nil {
                input.append(i!.decimalValue!)
            }
        }
        if input.count == 0 {
            medianLabel.text = "Enter Values for Median"
            meanLabel.text = "Enter Values for Mean"
            return
        }
        meanLabel.text = "Mean is: \(mean(arr: input))"
        medianLabel.text = "Median is: \(median(arr: input))"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

