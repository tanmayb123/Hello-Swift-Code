//
//  FileReader.swift
//  SwiftOFile
//
//  Created by Tanmay Bakshi on 2017-10-16.
//  Copyright © 2017 Tanmay Bakshi. All rights reserved.
//

import Foundation

class FileReader: FileContentManager {
    
    func returnContents() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let filePath = paths.characters.last! == "/" ? paths + filename : paths + "/" + filename
        if FileManager.default.fileExists(atPath: filePath) {
            return try! String(contentsOfFile: filePath)
        }
        return ""
    }
}
