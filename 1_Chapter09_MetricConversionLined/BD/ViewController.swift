//
//  ViewController.swift
//  BD
//
//  Created by Tanmay Bakshi on 2015-08-15.
//  Copyright © 2015 Tanmay Bakshi. All rights reserved.
//

import UIKit

//Book's code needs to be updated!

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

class Connector {
    
    var lines = [UIImageView]()
    var lineHeight = 3
    var lineWidth = 3
    var thickness: CGFloat {
        get {
            return CGFloat(((lineWidth + lineHeight)) + 10)
        }
    }
    
    var viewToEdit: UIView!
    
    var allFrames = [CGRect]()
    
    convenience init(initWithView view: UIView) {
        self.init()
        viewToEdit = view
    }
    
    func drawLineBetweenPoints(_ p1: CGPoint, p2: CGPoint) {
        if p1.x == p2.x && p1.y == p2.y {
            handleTouch(p1)
        }
        if p1.y == p2.y {
            if p2.x - p1.x > 1 {
                var xVal = p1.x
                for i in 1...Int(p2.x - p1.x) {
                    xVal += 1
                    handleTouch(CGPoint(x: xVal, y: p1.y))
                }
            } else if p2.x - p1.x < -1 {
                var xVal = p1.x
                for i in (Int(p2.x - p1.x))*2...Int(p2.x - p1.x) {
                    xVal -= 1
                    handleTouch(CGPoint(x: xVal, y: p1.y))
                }
            } else {
                
            }
        }
        else if p1.x == p2.x {
            if p2.y - p1.y > 1 {
                var yVal = p1.y
                for i in 1...Int(p2.y - p1.y) {
                    yVal += 1
                    handleTouch(CGPoint(x: p1.x, y: yVal))
                }
            } else if p2.y - p1.y < -1 {
                var yVal = p1.y
                for i in (Int(p2.y - p1.y))*2...Int(p2.y - p1.y) {
                    yVal -= 1
                    handleTouch(CGPoint(x: p1.x, y: yVal))
                }
            } else {
                
            }
        }
        else {
            let rise = p2.y - p1.y
            let run = p2.x - p1.x
            let res: Double = Double(rise) / Double(run)
            var whereToDraw = [CGPoint]()
            var xVal = Double(p1.x)
            var yVal = Double(p1.y)
            if run > 1 {
                for i in 1...Int(run) {
                    yVal += res
                    xVal += 1
                    handleTouch(CGPoint(x: xVal, y: yVal))
                }
            } else if run < -1 {
                xVal = Double(p2.x)
                yVal = Double(p2.y)
                for i in Int(run)*2...Int(run) {
                    yVal += res
                    xVal += 1
                    handleTouch(CGPoint(x: xVal, y: yVal))
                }
            } else if run == 1 {
                for i in 0...Int(run * (rise > 0 ? rise : -rise) ) {
                    yVal += res / Double(rise > 0 ? rise : -rise)
                    xVal += 1 / Double(rise > 0 ? rise : -rise)
                    handleTouch(CGPoint(x: xVal, y: yVal))
                }
            } else if run == -1 {
                drawLineBetweenPoints(p2, p2: p1)
                return
            }
        }
    }
    
    func handleTouch(_ location: CGPoint) {
        let newImage = UIImageView()
        newImage.backgroundColor = UIColor.black
        newImage.frame = CGRect(x: Int(location.x), y: Int(location.y), width: lineWidth, height: lineHeight)
        allFrames.append(newImage.frame)
        lines.append(newImage)
        drawLines()
    }
    
    func drawLines() {
        viewToEdit.subviews.map({ if self.allFrames.contains($0.frame) { $0.removeFromSuperview() } })
        for i in lines {
            viewToEdit.addSubview(i)
        }
    }
    
    func clear() {
        lines = []
        drawLines()
    }
    
}

class MetricConversionHandler {
    
    private var from = ""
    private var to = ""
    
    private var from_number: Float = 0.0
    
    private var values = ["kilometre": 1, "hectometre": 2, "decametre": 3, "metre": 4, "decimetre": 5, "centimetre": 6, "millimetre": 7]
    
    init(userFrom: String, userTo: String, fromNum: Float) {
        from = userFrom
        to = userTo
        from_number = fromNum
    }
    
    func convert() -> NSDecimalNumber {
        let numberToUse: Float = Float(pow(10.0, CGFloat(values[to]! - values[from]!)))
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        return NSDecimalNumber(string: "\(from_number * numberToUse)")
    }
    
}

class ViewController: UIViewController {

    @IBOutlet var input: UITextField!
    @IBOutlet var output: UILabel!
    @objc var from = ""
    @objc var fromButton: UIButton!
    var lineDrawer = Connector()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lineDrawer = Connector(initWithView: self.view)
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func fromClicked(_ sender: UIButton) {
        from = sender.text
        fromButton = sender
    }
    
    @IBAction func toClicked(_ sender: UIButton) {
        let metricHandlerInst = MetricConversionHandler(userFrom: from, userTo: sender.text, fromNum: Float(input.text!)!)
        output.text = "\(input.text!) \(from)(s) = \(metricHandlerInst.convert()) \(sender.text)(s)"
        lineDrawer.clear()
        lineDrawer.drawLineBetweenPoints(CGPoint(x: 110, y: fromButton.frame.origin.y + lineDrawer.thickness), p2: CGPoint(x: 260, y: sender.frame.origin.y + lineDrawer.thickness))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

