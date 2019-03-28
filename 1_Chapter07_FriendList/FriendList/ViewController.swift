//
//  ViewController.swift
//  FriendList
//
//  Created by Tanmay Bakshi on 2016-09-28.
//  Copyright © 2016 Tanmay Bakshi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var persons: [String: String] = [String: String]()
    
    @IBOutlet var personName: UITextField!
    @IBOutlet var personInfo: UITextField!
    @IBOutlet var personList: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func reload() {
        personList.text! = ""
        for (name, who) in persons {
            var finalString = "\(name), \(who)\n"
            personList.text! += finalString
        }
    }
    
    @IBAction func addPerson() {
        persons[personName.text!] = personInfo.text!
        personName.text = ""
        personInfo.text = ""
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

