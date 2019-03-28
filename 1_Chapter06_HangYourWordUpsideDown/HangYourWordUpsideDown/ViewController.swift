//
//  ViewController.swift
//  HangYourWordUpsideDown
//
//  Created by Tanmay Bakshi on 2016-08-07.
//  Copyright © 2016 Tanmay Bakshi. All rights reserved.
//

import UIKit

extension String {
    
    subscript(value: Int) -> String {
        get {
            var j = 0
            for i in self.characters {
                if j == (value) {
                    return "\(i)"
                }
                j += 1
            }
            return ""
        }
        set(toSet) {
            var array: [String] = []
            var finalString: String = ""
            for i in self.characters {
                array.append("\(i)")
            }
            array[value] = toSet
            for i in array {
                finalString += i
            }
            self = finalString
        }
    }
    
}

class ViewController: UIViewController {

    @IBOutlet var inputField: UITextField!
    @IBOutlet var outputField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func btnClicked() {
        
        var str = inputField.text!
        
        var strStart = 0
        var strEnd = str.characters.count - 1
        
        while strStart < strEnd {
            var temp = str[strStart]
            str[strStart] = str[strEnd]
            str[strEnd] = temp
            strEnd -= 1
            strStart += 1
        }
        
        outputField.text = "Reversed: \(str)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

