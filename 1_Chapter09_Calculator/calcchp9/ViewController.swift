//
//  ViewController.swift
//  calcchp9
//
//  Created by Tanmay Bakshi on 2015-08-28.
//  Copyright © 2015 Tanmay Bakshi. All rights reserved.
//

import UIKit

//Book's code to be updated! (Sept 28 2016)

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

class ListOfNumbers {
    
    var numberList: [Double] = []
    
    required init(initWithNumberList: [Double]) {
        numberList = initWithNumberList
    }
    
}

class Calculator: ListOfNumbers {
    
    func addAllInNumberList() -> Double {
        let temp = numberList
        var finalVal = numberList[0]
        numberList.remove(at: 0)
        numberList.map({finalVal += $0})
        numberList = temp
        return finalVal
    }
    
    func subtractAllInNumberList() -> Double {
        let temp = numberList
        var finalVal = numberList[0]
        numberList.remove(at: 0)
        numberList.map({finalVal -= $0})
        numberList = temp
        return finalVal
    }
    
    func multiplyAllInNumberList() -> Double {
        let temp = numberList
        var finalVal = numberList[0]
        numberList.remove(at: 0)
        numberList.map({finalVal *= $0})
        numberList = temp
        return finalVal
    }
    
    func divideAllInNumberList() -> Double {
        let temp = numberList
        var finalVal = numberList[0]
        numberList.remove(at: 0)
        numberList.map({finalVal /= $0})
        numberList = temp
        return finalVal
    }
    
}

class ViewController: UIViewController {

    @IBOutlet var inputNumbers: UITextView!
    
    @IBOutlet var outputNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func doOperation(_ sender: UIButton) {
        var finalNumberlist: [Double] = []
        inputNumbers.text.components(separatedBy: "\n").map({ finalNumberlist.append(Double($0)!) })
        let calculatorInstance = Calculator(initWithNumberList: finalNumberlist)
        if sender.text == "Add" {
            let shouldRemove = "\(calculatorInstance.addAllInNumberList())".components(separatedBy: ".")[1] == "0" ? true : false
            let intVal = Int("\(calculatorInstance.addAllInNumberList())".components(separatedBy: ".")[0])!
            outputNumber.text = shouldRemove ? "\(intVal)" : "\(calculatorInstance.addAllInNumberList())"
        } else if sender.text == "Subtract" {
            let shouldRemove = "\(calculatorInstance.subtractAllInNumberList())".components(separatedBy: ".")[1] == "0" ? true : false
            let intVal = Int("\(calculatorInstance.subtractAllInNumberList())".components(separatedBy: ".")[0])!
            outputNumber.text = shouldRemove ? "\(intVal)" : "\(calculatorInstance.subtractAllInNumberList())"
        } else if sender.text == "Multiply" {
            let shouldRemove = "\(calculatorInstance.multiplyAllInNumberList())".components(separatedBy: ".")[1] == "0" ? true : false
            let intVal = Int("\(calculatorInstance.multiplyAllInNumberList())".components(separatedBy: ".")[0])!
            outputNumber.text = shouldRemove ? "\(intVal)" : "\(calculatorInstance.multiplyAllInNumberList())"
        } else if sender.text == "Divide" {
            let shouldRemove = "\(calculatorInstance.divideAllInNumberList())".components(separatedBy: ".")[1] == "0" ? true : false
            let intVal = Int("\(calculatorInstance.divideAllInNumberList())".components(separatedBy: ".")[0])!
            outputNumber.text = shouldRemove ? "\(intVal)" : "\(calculatorInstance.divideAllInNumberList())"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

