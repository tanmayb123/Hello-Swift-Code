//
//  ViewController.swift
//  HowManyTimes
//
//  Created by Tanmay Bakshi on 2016-08-04.
//  Copyright © 2016 Tanmay Bakshi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var input: UITextField!
    @IBOutlet var output: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func count_1UpToN() {
        output.text = ""
        let j = Int(input.text!)
        for i in 1...j! {
            output.text = "\(output.text!)\(i) \n"
        }
    }
    
    @IBAction func count_NDownTo1() {
        output.text = ""
        var j = Int(input.text!)
        while j != 0 {
            output.text = "\(output.text!)\(j!) \n"
            j = j! - 1
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

