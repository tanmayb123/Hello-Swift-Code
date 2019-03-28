//
//  ViewController.swift
//  mixedupimproper
//
//  Created by Tanmay Bakshi on 2017-09-30.
//  Copyright © 2017 Tanmay Bakshi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var mixedInt: UITextField!
    @IBOutlet var mixedNum: UITextField!
    @IBOutlet var mixedDen: UITextField!
    
    @IBOutlet var improperNum: UITextField!
    @IBOutlet var improperDen: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func mixedNumberToImproperFraction(mixedNumberInteger: Int, mixedNumberNumerator: Int, mixedNumberDenominator: Int) -> [Int] {
        return [mixedNumberInteger * mixedNumberDenominator + mixedNumberNumerator, mixedNumberDenominator]
    }
    
    func improperFractionToMixedNumber(improperFractionNumerator: Int, improperFractionDenominator: Int) -> [Int] {
        return [Int(improperFractionNumerator / improperFractionDenominator), Int(improperFractionNumerator % improperFractionDenominator), improperFractionDenominator]
    }
    
    func factors(of: Int) -> [Int] {
        var factors: [Int] = []
        if of == 0 { return [] }
        for i in 1...of {
            if of % i == 0 {
                factors.append(i)
            }
        }
        return factors
    }
    
    func GCF(arr1: [Int], arr2: [Int]) -> Int? {
        var finalArr1: [Int] = []
        var finalArr2: [Int] = []
        for i in arr1 {
            if arr2.contains(i) {
                finalArr1.append(i)
            }
        }
        for i in arr2 {
            if arr1.contains(i) {
                finalArr2.append(i)
            }
        }
        return finalArr1.last
    }
    
    @IBAction func mixedToImproper() {
        improperNum.text = ""
        improperDen.text = ""
        if Int(mixedInt.text!) != nil && Int(mixedNum.text!) != nil && Int(mixedDen.text!) != nil {
            var result = mixedNumberToImproperFraction(mixedNumberInteger: Int(mixedInt.text!)!, mixedNumberNumerator: Int(mixedNum.text!)!, mixedNumberDenominator: Int(mixedDen.text!)!)
            let gcf = GCF(arr1: factors(of: result[0]), arr2: factors(of: result[1]))
            if gcf != nil {
                result[0] = result[0] / gcf!
                result[1] = result[1] / gcf!
            }
            improperNum.text = "\(result[0])"
            improperDen.text = "\(result[1])"
        }
    }
    
    @IBAction func improperToMixed() {
        mixedInt.text = ""
        mixedNum.text = ""
        mixedDen.text = ""
        if Int(improperNum.text!) != nil && Int(improperDen.text!) != nil {
            var result = improperFractionToMixedNumber(improperFractionNumerator: Int(improperNum.text!)!, improperFractionDenominator: Int(improperDen.text!)!)
            let gcf = GCF(arr1: factors(of: result[1]), arr2: factors(of: result[2]))
            if gcf != nil {
                result[1] = result[1] / gcf!
                result[2] = result[2] / gcf!
            }
            mixedInt.text = "\(result[0])"
            mixedNum.text = "\(result[1] != 0 ? "\(result[1])" : "")"
            mixedDen.text = "\(result[1] != 0 ? "\(result[2])" : "")"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

