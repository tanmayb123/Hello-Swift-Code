//
//  ViewController.swift
//  MoneyDenomination
//
//  Created by Tanmay Bakshi on 2015-07-01.
//  Copyright © 2015 Tanmay Bakshi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var inputMoney: UITextField!
    
    @IBOutlet var b100: UILabel!
    @IBOutlet var b50: UILabel!
    @IBOutlet var b20: UILabel!
    @IBOutlet var b10: UILabel!
    @IBOutlet var b5: UILabel!
    @IBOutlet var c2: UILabel!
    @IBOutlet var c1: UILabel!
    @IBOutlet var c25: UILabel!
    @IBOutlet var c10: UILabel!
    @IBOutlet var c5: UILabel!
    @IBOutlet var c1c: UILabel!
    
    @IBOutlet var totalLab: UILabel!
    
    @objc var moneyVals: [String: Int] = ["NB100d": 0, "NB50d": 0, "NB20d": 0, "NB10d": 0, "NB5d": 0, "NC2d": 0, "NC1d": 0, "NC25c": 0, "NC10c": 0, "NC5c": 0, "NC1c": 0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func denominateMoney() {
        
        moneyVals = ["NB100d": 0, "NB50d": 0, "NB20d": 0, "NB10d": 0, "NB5d": 0, "NC2d": 0, "NC1d": 0, "NC25c": 0, "NC10c": 0, "NC5c": 0, "NC1c": 0]
        var total = (inputMoney.text! as NSString).doubleValue
        print(total)
        
        if total >= 100 {
            
            let nOfBills: Int = Int(total / 100)
            total -= Double(nOfBills * 100)
            moneyVals["NB100d"] = nOfBills
            
        }

        if total >= 50 {
            
            let nOfBills: Int = Int(total / 50)
            total -= Double(nOfBills * 50)
            moneyVals["NB50d"] = nOfBills
            
        }

        if total >= 20 {
            
            let nOfBills: Int = Int(total / 20)
            total -= Double(nOfBills * 20)
            moneyVals["NB20d"] = nOfBills
            
        }
        
        if total >= 10 {
            
            let nOfBills: Int = Int(total / 10)
            total -= Double(nOfBills * 10)
            moneyVals["NB10d"] = nOfBills
            
        }
        
        if total >= 5 {
            
            let nOfBills: Int = Int(total / 5)
            total -= Double(nOfBills * 5)
            moneyVals["NB5d"] = nOfBills
            
        }

        if total >= 2 {
            
            let nOfBills: Int = Int(total / 2)
            total -= Double(nOfBills * 2)
            moneyVals["NC2d"] = nOfBills
            
        }

        if total >= 1 {
            
            let nOfBills: Int = Int(total / 1)
            total -= Double(nOfBills * 1)
            moneyVals["NC1d"] = nOfBills
            
        }
        
        total = round(100 * total) / 100
        total = total * 100
        if total >= 25 {
            
            let nOfCoins: Int = Int(total / 25)
            total -= Double(nOfCoins) * 25
            moneyVals["NC25c"] = (nOfCoins)
            
        }

        if total >= 10 {
            
            let nOfCoins: Int = Int(total / 10)
            total -= Double(nOfCoins) * 10
            moneyVals["NC10c"] = (nOfCoins)
            
        }
        
        if total >= 5 {
            
            let nOfCoins: Int = Int(total / 5)
            total -= Double(nOfCoins) * 5
            moneyVals["NC5c"] = (nOfCoins)
            
        }
        
        if total >= 1 {
            
            let nOfCoins: Int = Int(total / 1)
            moneyVals["NC1c"] = (nOfCoins)
            
        }
        
        var total__: Double = 0
        total__ += Double(moneyVals["NB100d"]!) * 100
        total__ += Double(moneyVals["NB50d"]!) * 50
        total__ += Double(moneyVals["NB20d"]!) * 20
        total__ += Double(moneyVals["NB10d"]!) * 10
        total__ += Double(moneyVals["NB5d"]!) * 5
        total__ += Double(moneyVals["NC2d"]!) * 2
        total__ += Double(moneyVals["NC1d"]!)
        total__ += Double(moneyVals["NC25c"]!) * 0.25
        total__ += Double(moneyVals["NC10c"]!) * 0.10
        total__ += Double(moneyVals["NC5c"]!) * 0.05
        total__ += Double(moneyVals["NC1c"]!) * 0.01
        
        totalLab.text = "\(total__)"
        
        putValuesInLabels()
        
    }
    
    @objc func putValuesInLabels() {
        
        let b100V = (moneyVals["NB100d"]!)
        let b50V = (moneyVals["NB50d"]!)
        let b20V = (moneyVals["NB20d"]!)
        let b10V = (moneyVals["NB10d"]!)
        let b5V = (moneyVals["NB5d"]!)
        let c2V = (moneyVals["NC2d"]!)
        let c1V = (moneyVals["NC1d"]!)
        let c25V = (moneyVals["NC25c"]!)
        let c10V = (moneyVals["NC10c"]!)
        let c5V = (moneyVals["NC5c"]!)
        let c01V = (moneyVals["NC1c"]!)
        
        b100.text = "\(b100V)"
        b50.text = "\(b50V)"
        b20.text = "\(b20V)"
        b10.text = "\(b10V)"
        b5.text = "\(b5V)"
        c2.text = "\(c2V)"
        c1.text = "\(c1V)"
        c25.text = "\(c25V)"
        c10.text = "\(c10V)"
        c5.text = "\(c5V)"
        c1c.text = "\(c01V)"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

