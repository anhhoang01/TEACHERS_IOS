//
//  isValid.swift
//  TEACHERS_IOS
//
//  Created by mac on 8/22/18.
//  Copyright © 2018 jilnesta. All rights reserved.
//

import Foundation
import UIKit

class ValidatedHelper: NSObject {
    static func isValidEmail(_ emailText: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,100}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: emailText)
        return result
    }
    
    static func isValidatePhoneNumber(_ value: String) -> Bool {
        let PHONE_REGEX = "\\+?[0-9]{1,15}"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: value)
        return result
    }
    
    static func isValidatePassword(_ value: String) -> Bool {
        let trimmedString = value.trim()
        if NSString(string: trimmedString).length > 6 {
            return true
        }
        return false
    }
    
    static func stringIsDecimalNumber(_ stringValue: String) -> Bool {
        let scan = Scanner(string: stringValue)
        scan.charactersToBeSkipped = CharacterSet(charactersIn: "1234567890.").inverted
        if scan.scanDouble(nil) {
            return scan.isAtEnd
        } else {
            return false
        }
    }
    
}
