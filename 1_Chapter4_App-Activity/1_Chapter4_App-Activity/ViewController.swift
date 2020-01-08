//
//  ViewController.swift
//  Chapter4_Apptivity
//
//  Created by Tanmay Bakshi on 2015-11-28.
//  Copyright © 2015 Tanmay Bakshi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var input1: UITextField!
    @IBOutlet var input2: UITextField!
    @IBOutlet var output: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func btnConcatClicked() {
        output.text = input1.text! + input2.text!
    }
    
    @IBAction func btnAddClicked() {
        output.text = "\(Int(input1.text!)! + Int(input2.text!)!)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

