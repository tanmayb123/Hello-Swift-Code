//
//  ViewController.swift
//  hangman
//
//  Created by Tanmay Bakshi on 2015-10-01.
//  Copyright © 2015 Tanmay Bakshi. All rights reserved.
//

import UIKit

//Book's code needs to be updated!

extension Array {
    
    func randomElement() -> String {
        return self[Int(arc4random_uniform(UInt32(self.count-1)))] as! String
    }
    
}

class ViewController: UIViewController {

    @IBOutlet var wordLabel: UILabel!
    @IBOutlet var triesLeft: UILabel!
    @IBOutlet var inputLetter: UITextField!
    @IBOutlet var lettersLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    
    let maximumTries = 10
    var currentTries = 0
    
    var currentWord = ""
    var wordArray: [String] = []
    var tryArray: [String] = []
    var usedLetters: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newGame()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func possibleWords() -> [String] {
        let stringVal = String(data: try! Data(contentsOf: URL(string: "https://github.com/dwyl/english-words/raw/master/words.txt")!), encoding: String.Encoding.utf8)
        return stringVal!.replacingOccurrences(of: "\r", with: "").components(separatedBy: "\n")
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
    
    func getHighscoreStatus() -> String {
        var finalValue = ""
        if read(file: "highscore.txt") == "" && read(file: "lastscore.txt") == "" {
            finalValue = "No saved scores."
        } else {
            finalValue = "Last score: \(read(file: "lastscore.txt")) | Highest score: \(read(file: "highscore.txt"))"
        }
        return finalValue
    }
    
    func writeScore() {
        var highscore = 0
        if read(file: "highscore.txt") != "" {
            highscore = Int(read(file: "highscore.txt"))!
        }
        if currentTries > highscore {
            highscore = currentTries
        }
        write(file: "highscore.txt", value: "\(highscore)", newline: false, overwrite: true)
        write(file: "lastscore.txt", value: "\(currentTries)", newline: false, overwrite: true)
    }
    
    func newWord() {
        wordLabel.text = possibleWords().randomElement()
        currentWord = wordLabel.text!
        wordArray = []
        tryArray = []
        for i in currentWord.characters {
            wordArray.append("\(i)")
            tryArray.append("_")
        }
    }
    
    func newGame() {
        currentTries = maximumTries
        newWord()
        updateWordLabel()
        updateTryLabel()
        usedLetters = []
        updateLetterLabel()
        inputLetter.text = ""
        statusLabel.text = getHighscoreStatus()
    }
    
    @IBAction func newGameClicked() {
        newGame()
    }
    
    func gameover() {
        writeScore()
        statusLabel.text = getHighscoreStatus()
        tryArray = wordArray
        updateWordLabel()
    }
    
    @IBAction func letterClicked() {
        if currentTries != 0 && !usedLetters.contains(inputLetter.text!) && inputLetter.text! != "" {
            var wasUseful = false
            for (ind, val) in wordArray.enumerated() {
                if val == inputLetter.text! {
                    tryArray[ind] = val
                    wasUseful = true
                }
            }
            if !wasUseful {
                currentTries -= 1
            }
            usedLetters.append(inputLetter.text!)
            updateTryLabel()
            updateWordLabel()
            updateLetterLabel()
        }
        if tryArray == wordArray {
            triesLeft.text! = "YOU WON!"
            gameover()
        }
        if currentTries == 0 {
            triesLeft.text = "You lost."
            gameover()
        }
        inputLetter.text = ""
    }
    
    func updateTryLabel() {
        triesLeft.text = "\(currentTries)"
    }
    
    func updateWordLabel() {
        wordLabel.text = ""
        for i in tryArray {
            wordLabel.text! += "\(i)  "
        }
    }
    
    func updateLetterLabel() {
        lettersLabel.text = "a b c d e f g h i j k l m n o p q r s t u v w x y z"
        for i in usedLetters {
            lettersLabel.text = lettersLabel.text!.replacingOccurrences(of: i, with: " ")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

/*
//
//  ViewController.swift
//  hangman
//
//  Created by Tanmay Bakshi on 2015-10-01.
//  Copyright © 2015 Tanmay Bakshi. All rights reserved.
//

import UIKit

extension Array {

func randomElement() -> String {
return self[Int(arc4random_uniform(UInt32(self.count-1)))] as! String
}

}

class ViewController: UIViewController {

@IBOutlet var wordLabel: UILabel!
@IBOutlet var triesLeft: UILabel!
@IBOutlet var inputLetter: UITextField!
@IBOutlet var lettersLabel: UILabel!

let maximumTries = 10
var currentTries = 0

var currentWord = ""
var wordArray: [String] = []
var tryArray: [String] = []
var playing = true

var usedLetters: [String] = []

override func viewDidLoad() {
super.viewDidLoad()
currentTries = maximumTries
newGame()
// Do any additional setup after loading the view, typically from a nib.
}

func possibleWords() -> [String] {
var stringVal = String(data: NSData(contentsOfFile: NSBundle.mainBundle().pathForResource("words", ofType: "txt")!)!, encoding: NSUTF8StringEncoding)
return stringVal!.componentsSeparatedByString("\n")
}

func newWord() {
wordLabel.text = possibleWords().randomElement()
currentWord = wordLabel.text!
wordArray = []
tryArray = []
currentWord.characters.map({ wordArray.append("\($0)"); tryArray.append("_") })
}

func newGame() {
currentTries = maximumTries
newWord()
updateWordLabel()
updateTryLabel()
usedLetters = []
updateLetterLabel()
playing = true
inputLetter.text = ""
}

@IBAction func letterClicked() {
if currentTries != 0 && playing && !usedLetters.contains(inputLetter.text!) {
var wasUseful = false
for (ind, val) in wordArray.enumerate() {
print(inputLetter.text!)
if val == inputLetter.text! {
tryArray[ind] = val
if !wasUseful { wasUseful = true }
}
}
if !wasUseful {
currentTries--
}
usedLetters.append(inputLetter.text!)
updateTryLabel()
updateWordLabel()
updateLetterLabel()
inputLetter.text = ""
}
if tryArray == wordArray && playing {
triesLeft.text! = "YOU WON! Click to play again."
playing = false
inputLetter.text = ""
return
}
if triesLeft.text! == "YOU WON! Click to play again." {
newGame()
return
}
if triesLeft.text! == "You lost. Click to play again." {
newGame()
return
}
if currentTries == 0 && playing {
triesLeft.text = "You lost. Click to play again."
tryArray = wordArray
updateWordLabel()
playing = false
inputLetter.text = ""
return
}
}

func updateTryLabel() {
triesLeft.text = "\(currentTries)"
}

func updateWordLabel() {
wordLabel.text = ""
tryArray.map({ wordLabel.text! += "\($0) " })
}

func updateLetterLabel() {
for i in usedLetters {
lettersLabel.text = lettersLabel.text!.stringByReplacingOccurrencesOfString(i, withString: " ")
}
}

override func didReceiveMemoryWarning() {
super.didReceiveMemoryWarning()
// Dispose of any resources that can be recreated.
}


}

*/
