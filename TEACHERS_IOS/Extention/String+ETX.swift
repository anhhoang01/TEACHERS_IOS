//
//  String.swift
//  TEACHERS_IOS
//
//  Created by mac on 8/22/18.
//  Copyright © 2018 jilnesta. All rights reserved.
//

import Foundation
import UIKit


//MARK: Limit string in textfield
extension String
{
    func safelyLimitedTo(length n: Int)->String {
        if (self.count <= n) {
            return self
        }
        return String( Array(self).prefix(upTo: n) )
    }
}
extension String {
    func isNotNull() -> Bool {
        if self != "" {
            return true
        } else {
            return false
        }
    }
    
    func trim() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func getArrayDropdown() -> [String]?{
        if let data = self.data(using: .utf8) {
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                return json as? [String]
            } catch {
                print(error)
            }
        }
        return nil
    }
    
    func getNameImage() -> String {
        guard let index = self.index(of: "/") else { return self }
        let newStr = self[index...]
        guard let index2 = newStr.index(of: "-") else { return self }
        let newSrt2 = newStr[index2...]
        return String(newSrt2.dropFirst())
    }
    
    func height(constraintedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let label =  UILabel(frame: CGRect(x: 0, y: 0, width: width, height: .greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.text = self
        label.font = font
        label.sizeToFit()
        
        return label.frame.height
    }
    
    static func random(length: Int = 20) -> String {
        let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomString: String = ""
        
        for _ in 0..<length {
            let randomValue = arc4random_uniform(UInt32(base.count))
            randomString += "\(base[base.index(base.startIndex, offsetBy: Int(randomValue))])"
        }
        return randomString
    }
    
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    func index(at offset: Int, from start: Index? = nil) -> Index? {
        return index(start ?? startIndex, offsetBy: offset, limitedBy: endIndex)
    }
    subscript(_ range: CountableRange<Int>) -> Substring {
        precondition(range.lowerBound >= 0, "lowerBound can't be negative")
        let start = index(at: range.lowerBound) ?? endIndex
        return self[start..<(index(at: range.count, from: start) ?? endIndex)]
    }
    subscript(_ range: CountableClosedRange<Int>) -> Substring {
        precondition(range.lowerBound >= 0, "lowerBound can't be negative")
        let start = index(at: range.lowerBound) ?? endIndex
        return self[start..<(index(at: range.count, from: start) ?? endIndex)]
    }
}

extension UILabel {
    func width() -> CGFloat {
        let size = (self.text! as NSString).size(withAttributes: [NSAttributedStringKey.font: self.font])
        return size.width
    }
}
