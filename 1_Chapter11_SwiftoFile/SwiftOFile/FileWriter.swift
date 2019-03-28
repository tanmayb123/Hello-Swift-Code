//
//  FileWriter.swift
//  SwiftOFile
//
//  Created by Tanmay Bakshi on 2017-10-16.
//  Copyright © 2017 Tanmay Bakshi. All rights reserved.
//

import Foundation

class FileWriter: FileContentManager {
    
    var towrite = ""
    var overwrite = false
    var newline = false
    
    func writeToFile() {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let filePath = paths.characters.last! == "/" ? paths + filename : paths + "/" + filename
        if newline {
            towrite = "\n" + towrite
        }
        if !overwrite {
            if FileManager.default.fileExists(atPath: filePath) {
                towrite = FileReader(inputfilename: filename).returnContents() + towrite
            }
        }
        try! towrite.write(toFile: filePath, atomically: true, encoding: String.Encoding.utf8)
    }
    
}
