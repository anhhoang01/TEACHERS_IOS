//
//  NikmeLogger.swift
//
//  Created by Tony Tuong on 8/28/16.
//  Copyright © 2016 Nikmesoft Ltd Co. All rights reserved.
//

import UIKit

class NikmeLogger {
    
    static var turnOnLog = true
    
    class func log(_ message: @autoclosure () -> Any, file: String = #file, _ function: String = #function, _ line: Int = #line) {
        NikmeLogger.abstractLog("LOG 👉", message: "\(message())", file, function, line)
    }
    
    class func error(_ message: @autoclosure () -> Any, file: String = #file, _ function: String = #function, _ line: Int = #line) {
        NikmeLogger.abstractLog("ERROR 🚫", message: "\(message())", file, function, line)
    }
    
    class func debug(_ message: @autoclosure () -> Any, file: String = #file, _ function: String = #function, _ line: Int = #line) {
        NikmeLogger.abstractLog("DEBUG 🚩", message: "\(message())", file, function, line)
    }
    
    class func success(_ message: @autoclosure () -> Any, file: String = #file, _ function: String = #function, _ line: Int = #line) {
        NikmeLogger.abstractLog("SUCCESS 👍", message: "\(message())", file, function, line)
    }
    
    static func abstractLog(_ logType: String, message: String, _ file: String, _ function: String, _ line: Int) {
        
        guard NikmeLogger.turnOnLog else { return }
        
        var destination = ""
        if let unwrap = file.components(separatedBy: "/").last?.components(separatedBy: ".") , let unwrapObj = unwrap.first {
            destination = unwrapObj
        }
        
        var str = ""
        str += "📝 \(destination)"
        str += " - \(function) - \(line) ➢ "
        str += "\(logType) : "
        str += "\(message)"
        
        NSLog("%@", str)
    
    }
}

