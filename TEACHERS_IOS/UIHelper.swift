//
//  UIHelper.swift
//  TEACHERS_IOS
//
//  Created by mac on 8/23/18.
//  Copyright © 2018 jilnesta. All rights reserved.
//

import Foundation
import UIKit
class UIHelper:NSObject {
    
    static func StringToDate(date:String, dateFormat:String, timeZone:String?=nil) -> Date {
        guard date.isNotNull() else {
            return Date()
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        
        //if current thread is main, not need pass timezone, opposite need pass timezone because currentUser is using mainContext !!
        if let timeZone = timeZone {
            dateFormatter.timeZone = TimeZone(identifier: timeZone)
        } else {
//            if let timeZone = UserManager.shared.currentUser?.company?.companyInfo?.timezone {
//                dateFormatter.timeZone = TimeZone(identifier: timeZone)
//            }
        }
        dateFormatter.amSymbol = "am"
        dateFormatter.pmSymbol = "pm"
        return dateFormatter.date(from: date)!
    }
    
    static func DateToString(date:Date, dateFormat:String, timeZone:String?=nil) ->String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        //if current thread is main, not need pass timezone, opposite need pass timezone because currentUser is using mainContext !!
        if let timeZone = timeZone {
            dateFormatter.timeZone = TimeZone(identifier: timeZone)
        } else {
//            if let timeZone = WMUserManager.shared.currentUser?.company?.companyInfo?.timezone {
//                dateFormatter.timeZone = TimeZone(identifier: timeZone)
//            }
        }
        dateFormatter.amSymbol = "am"
        dateFormatter.pmSymbol = "pm"
        return dateFormatter.string(from: date)
    }
}

