//
//  Date+ETX.swift
//  TEACHERS_IOS
//
//  Created by mac on 8/23/18.
//  Copyright © 2018 jilnesta. All rights reserved.
//

import Foundation
fileprivate class Constants {
    static let resource = "LocalizedTimeAgo"
}

fileprivate extension Bundle {
    
    static var moduleBundle: Bundle {
        guard let path = Bundle(for: Constants.self).resourcePath else { return .main }
        return Bundle(path: path.appending("/\(Constants.resource).bundle")) ?? .main
    }
    
}

fileprivate extension String {
    
    func adjustedKey(forValue value: Int) -> String {
        let code = Bundle.main.preferredLocalizations.first ?? "en"
        if code != "ru" && code != "uk" { return self }
        let xy = Int(floor(Double(value)).truncatingRemainder(dividingBy: 100))
        let y = Int(floor(Double(value)).truncatingRemainder(dividingBy: 10))
        if(y == 0 || y > 4 || (xy > 10 && xy < 15)) { return self }
        if(y > 1 && y < 5 && (xy < 10 || xy > 20))  { return "_" + self }
        if(y == 1 && xy != 11) { return "__" + self }
        return self
    }
    
    func localized() -> String {
        return NSLocalizedString(self, tableName: Constants.resource, bundle: Bundle.moduleBundle, value: "", comment: "")
    }

}
import Foundation
extension Date {
    func timeAgoFromNow() -> String {
        let yearComponents = Calendar.current.dateComponents([.year], from: self, to: Date())
        
        if let year = yearComponents.year, year > 0 {
            return "\(year) year ago"
        }
        let monthsComponents = Calendar.current.dateComponents([.month], from: self, to: Date())
        if let months = monthsComponents.month, months > 0 {
            return "\(months) month ago"
        }
        let weekComponents = Calendar.current.dateComponents([.weekOfYear], from: self, to: Date())
        if let weeks = weekComponents.weekOfYear, weeks > 0 {
            return "\(weeks) week ago"
        }
        let dayComponents = Calendar.current.dateComponents([.day], from: self, to: Date())
        if let days = dayComponents.day, days > 0 {
            return "\(days) day ago"
        }
        let hoursComponents = Calendar.current.dateComponents([.hour], from: self, to: Date())
        if let hours = hoursComponents.hour, hours > 0 {
            return "\(hours) hours ago"
        }
        let minutesComponents = Calendar.current.dateComponents([.minute], from: self, to: Date())
        if let minutes = minutesComponents.minute, minutes > 0 {
            return "\(minutes) minutes ago"
        }
        return "just now ago"
    }
}
extension Date
{
    init(dateString:String) {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "MM/dd/yyyy"
        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale!
        let d = dateStringFormatter.date(from: dateString)!
        self.init(timeInterval:0, since:d)
    }
}
