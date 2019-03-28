//
//  ViewController.swift
//  BD
//
//  Created by Tanmay Bakshi on 2015-08-15.
//  Copyright © 2015 Tanmay Bakshi. All rights reserved.
//

import UIKit

//Book's code to be updated!

extension UIButton {
    @objc var text: String {
        get {
            return self.titleLabel!.text!
        }
        set {
            self.setTitle(newValue, for: UIControlState())
        }
    }
}

class MetricConversionHandler {
    
    private var from = ""
    private var to = ""
    
    private var from_number: Float = 0.0
    
    private var values = ["kilometre": 1, "hectometre": 2, "decametre": 3, "metre": 4, "decimetre": 5, "centimetre": 6, "millimetre": 7]
    
    init(userFrom: String, userTo: String, fromNum: Float) {
        from = userFrom
        to = userTo
        from_number = fromNum
    }
    
    func convert() -> NSDecimalNumber {
        let numberToUse: Float = Float(pow(10.0, CGFloat(values[to]! - values[from]!)))
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        return NSDecimalNumber(string: "\(from_number * numberToUse)")
    }
    
}

class ViewController: UIViewController {

    @IBOutlet var input: UITextField!
    @IBOutlet var output: UILabel!
    
    @objc var from = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func fromClicked(_ sender: UIButton) {
        from = sender.text
        output.text = "\(input.text!) \(from)(s) = (Give the \"To\" part)"
    }
    
    @IBAction func toClicked(_ sender: UIButton) {
        let metricHandlerInst = MetricConversionHandler(userFrom: from, userTo: sender.text, fromNum: Float(input.text!)!)
        output.text! = "\(input.text!) \(from)(s) = \(metricHandlerInst.convert()) \(sender.text)(s)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

