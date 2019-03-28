//
//  ViewController.swift
//  howbigisatriangle
//
//  Created by Tanmay Bakshi on 2017-09-30.
//  Copyright © 2017 Tanmay Bakshi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var triangleHeight: UITextField!
    @IBOutlet var triangleBase: UITextField!
    @IBOutlet var triangleSide1: UITextField!
    @IBOutlet var triangleSide2: UITextField!
    @IBOutlet var triangleSide3: UITextField!
    @IBOutlet var triangleArea: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func reset() {
        triangleSide1.text = ""
        triangleSide2.text = ""
        triangleSide3.text = ""
        triangleHeight.text = ""
        triangleBase.text = ""
        triangleArea.text = "Output Will Come Here"
    }
    
    @IBAction func getArea() {
        if Double(triangleHeight.text!) != nil && Double(triangleBase.text!) != nil {
            triangleArea.text = "\(Double(triangleHeight.text!)! * Double(triangleBase.text!)! / 2) sq units"
        } else if Double(triangleSide1.text!) != nil && Double(triangleSide2.text!) != nil && Double(triangleSide3.text!) != nil {
            let perim = Double(triangleSide1.text!)! + Double(triangleSide2.text!)! + Double(triangleSide3.text!)!
            let semiperim = Double(perim / 2)
            let heron = sqrt(Double(semiperim * (semiperim - Double(triangleSide1.text!)!) * (semiperim - Double(triangleSide2.text!)!) * (semiperim - Double(triangleSide3.text!)!)))
            triangleArea.text = "\(heron) sq units"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

