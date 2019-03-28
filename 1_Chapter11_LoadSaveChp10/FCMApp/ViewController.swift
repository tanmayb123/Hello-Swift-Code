//
//  ViewController.swift
//  FCMApp
//
//  Created by Tanmay Bakshi on 2016-09-28.
//  Copyright © 2016 Tanmay Bakshi. All rights reserved.
//

import UIKit
import SwiftOFile

class ViewController: UIViewController {
    
    @IBOutlet var writeField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func load() {
        let fileContentManaging = SwiftoFile(userfilename: "infoSave.txt")
        writeField.text = fileContentManaging.read()
    }
    
    @IBAction func save() {
        let fileContentManaging = SwiftoFile(userfilename: "infoSave.txt")
        fileContentManaging.write(content: writeField.text!, overwriteFile: true, appendNewline: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
