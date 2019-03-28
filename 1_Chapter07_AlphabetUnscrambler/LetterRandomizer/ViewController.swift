//
//  ViewController.swift
//  LetterRandomizer
//
//  Created by Tanmay Bakshi on 2015-06-06.
//  Copyright (c) 2015 Tanmay Bakshi Software Solutions. All rights reserved.
//

import UIKit

extension Array {
    func shuffle() -> Array {
        var tempArr = self
        for (index, i) in self.enumerated() { //Book's code to be updated here
            let rand = Int(arc4random_uniform(UInt32(tempArr.count-1)))
            let temp = tempArr[rand]
            tempArr[rand] = tempArr[index]
            tempArr[index] = temp
        }
        return tempArr
    }
}

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

class ViewController: UIViewController {

    @objc var alphabet: [String] = []
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var button4: UIButton!
    @IBOutlet var button5: UIButton!
    @IBOutlet var button6: UIButton!
    @IBOutlet var button7: UIButton!
    @IBOutlet var button8: UIButton!
    @IBOutlet var button9: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I"]
        alphabet = alphabet.shuffle()
        button1.setTitle(alphabet[0], for: UIControlState())
        button2.setTitle(alphabet[1], for: UIControlState())
        button3.setTitle(alphabet[2], for: UIControlState())
        button4.setTitle(alphabet[3], for: UIControlState())
        button5.setTitle(alphabet[4], for: UIControlState())
        button6.setTitle(alphabet[5], for: UIControlState())
        button7.setTitle(alphabet[6], for: UIControlState())
        button8.setTitle(alphabet[7], for: UIControlState())
        button9.setTitle(alphabet[8], for: UIControlState())
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func btnClicked(_ sender: UIButton) {
        var indexTo: Int = 0
        var index = 0
        for i in alphabet {
            if i == sender.text { //Book's code to be updated here
                indexTo = index
            }
            index += 1
        }
        let indexFrom: Int = 0
        var newArray: [String] = []
        for i in indexFrom...indexTo {
            newArray.append(alphabet[i])
        }
        //REVERSE NEW ARRAY!
        var k = 0
        var j = newArray.count-1
        while k < j {
            let temp = newArray[j]
            newArray[j] = newArray[k]
            newArray[k] = temp
            k += 1
            j -= 1
        }
        //ADD TO OLD ARRAY!
        for i in indexFrom...indexTo {
            alphabet[i] = newArray[i]
        }
        button1.setTitle(alphabet[0], for: UIControlState())
        button2.setTitle(alphabet[1], for: UIControlState())
        button3.setTitle(alphabet[2], for: UIControlState())
        button4.setTitle(alphabet[3], for: UIControlState())
        button5.setTitle(alphabet[4], for: UIControlState())
        button6.setTitle(alphabet[5], for: UIControlState())
        button7.setTitle(alphabet[6], for: UIControlState())
        button8.setTitle(alphabet[7], for: UIControlState())
        button9.setTitle(alphabet[8], for: UIControlState())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

