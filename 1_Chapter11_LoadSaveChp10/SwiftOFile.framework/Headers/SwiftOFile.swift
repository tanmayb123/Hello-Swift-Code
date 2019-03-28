//
//  SwiftOFile.swift
//  SwiftOFile
//
//  Created by Tanmay Bakshi on 2017-10-16.
//  Copyright © 2017 Tanmay Bakshi. All rights reserved.
//

import Foundation

public class SwiftoFile {
    
    var reader: FileReader!
    var writer: FileWriter!
    
    var canOperate = false
    
    public init() {
        canOperate = false
    }
        
    public init(userfilename: String) {
        canOperate = true
        reader = FileReader(inputfilename: userfilename)
        writer = FileWriter(inputfilename: userfilename)
    }
    
    public func write(content: String, overwriteFile: Bool, appendNewline: Bool) {
        if canOperate {
            writer.towrite = content
            writer.overwrite = overwriteFile
            writer.newline = appendNewline
            writer.writeToFile()
        } else {
            print("Not able to operate. You probably missed out the file [CA]name.")
        }
    }
    
    public func read() -> String {
        if canOperate {
            return reader.returnContents()
        } else {
            print("Not able to operate. You probably missed out the file [CA]name.")
        }
        return ""
    }
        
}
