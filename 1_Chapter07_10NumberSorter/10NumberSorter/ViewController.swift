//
//  ViewController.swift
//  10NumberSorter
//
//  Created by Tanmay Bakshi on 2016-09-28.
//  Copyright © 2016 Tanmay Bakshi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var textfield1:  UITextField!
    @IBOutlet var textfield2:  UITextField!
    @IBOutlet var textfield3:  UITextField!
    @IBOutlet var textfield4:  UITextField!
    @IBOutlet var textfield5:  UITextField!
    @IBOutlet var textfield6:  UITextField!
    @IBOutlet var textfield7:  UITextField!
    @IBOutlet var textfield8:  UITextField!
    @IBOutlet var textfield9:  UITextField!
    @IBOutlet var textfield10: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func checkNumbers() {
        var numArray = [
            Int(textfield1.text!)!,
            Int(textfield2.text!)!,
            Int(textfield3.text!)!,
            Int(textfield4.text!)!,
            Int(textfield5.text!)!,
            Int(textfield6.text!)!,
            Int(textfield7.text!)!,
            Int(textfield8.text!)!,
            Int(textfield9.text!)!,
            Int(textfield10.text!)!
        ]
        for outerLoop in 0...numArray.count-2 {
            for innerLoop in outerLoop...numArray.count-1 {
                if numArray[outerLoop] > numArray[innerLoop] {
                    var temp = numArray[outerLoop]
                    numArray[outerLoop] = numArray[innerLoop]
                    numArray[innerLoop] = temp
                }
            }
        }
        textfield1.text = "\(numArray[0])"
        textfield2.text = "\(numArray[1])"
        textfield3.text = "\(numArray[2])"
        textfield4.text = "\(numArray[3])"
        textfield5.text = "\(numArray[4])"
        textfield6.text = "\(numArray[5])"
        textfield7.text = "\(numArray[6])"
        textfield8.text = "\(numArray[7])"
        textfield9.text = "\(numArray[8])"
        textfield10.text = "\(numArray[9])"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


