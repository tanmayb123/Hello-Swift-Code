//
//  ViewController.swift
//  FCMApp
//
//  Created by Tanmay Bakshi on 2016-09-28.
//  Copyright © 2016 Tanmay Bakshi. All rights reserved.
//

import UIKit

//Book's code to be updated!

class ViewController: UIViewController {
    
    @IBOutlet var writeField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @objc func read(file: String) -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let pathToFile = (paths as NSString).appendingPathComponent(file)
        if FileManager.default.fileExists(atPath: pathToFile) {
            return String(data: NSData(contentsOfFile: pathToFile)! as Data, encoding: String.Encoding.utf8)!
        } else {
            return ""
        }
    }
    
    @objc func write(file: String, value: String, newline: Bool, overwrite: Bool) {
        var paths: [AnyObject] = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as [AnyObject]
        let documentsDirectory: String = paths[0] as! String
        let filePath: String = "\(documentsDirectory)/\(file)"
        if !overwrite {
            if newline {
                try! (read(file: file) + "\n" + value).write(toFile: filePath, atomically: true, encoding: String.Encoding.utf8)
            } else {
                try! (read(file: file) + value).write(toFile: filePath, atomically: true, encoding: String.Encoding.utf8)
            }
        } else {
            try! value.write(toFile: filePath, atomically: true, encoding: String.Encoding.utf8)
        }
    }
    
    
    @IBAction func save() {
        write(file: "infoSave.txt", value: writeField.text!, newline: false, overwrite: true)
    }
    
    @IBAction func load() {
        writeField.text = read(file: "infoSave.txt")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
