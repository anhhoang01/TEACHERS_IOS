//
//  Date+EXT.swift
//  wimo-ios
//
//  Created by Unima M2001 on 12/25/17.
//  Copyright © 2017 Unima M2001. All rights reserved.
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
/*public extension Date {
    
    private var calendar: Calendar { var calendar = Calendar.current
        if let timeZone = WMUserManager.shared.currentUser?.company?.companyInfo?.timezone, let TimeZone = TimeZone(identifier: timeZone){
            calendar.timeZone = TimeZone
        }
        return calendar
    }
    
    private var components: DateComponents {
        let unitFlags = Set<Calendar.Component>([.second,.minute,.hour,.day,.weekOfYear,.month,.year])
        let stringDate = UIHelper.DateToString(date: Date(), dateFormat: TimeFormat.DATE_TIME_FORMAT)
        let now = UIHelper.StringToDate(date: stringDate, dateFormat: TimeFormat.DATE_TIME_FORMAT)
        return calendar.dateComponents(unitFlags, from: self, to: now)
    }
    
    public func timeAgo(numericDates: Bool = false) -> String {
        if let timeZone = WMUserManager.shared.currentUser?.company?.companyInfo?.timezone, let TimeZone = TimeZone(identifier: timeZone) {
            let myDateComponents = calendar.dateComponents(in: TimeZone, from: self)
            let currentDateConponents = calendar.dateComponents(in: TimeZone, from: Date())
            
            if let year1 = myDateComponents.year, let year2 = currentDateConponents.year, year2 - year1 > 0 {
                let year = year2 - year1
                if year >= 2 { return String(format: "%d years ago".adjustedKey(forValue: year).localized(), year) }
                return numericDates ? "1 year ago".localized() : "Last year".localized()
            } else if let month1 = myDateComponents.month, let month2 = currentDateConponents.month, month2 - month1 > 0  {
                let month = month2 - month1
                if month >= 2 { return String(format: "%d months ago".adjustedKey(forValue: month).localized(), month) }
                return numericDates ? "1 month ago".localized() : "Last month".localized()
            } else if let week1 = myDateComponents.weekOfYear, let week2 = currentDateConponents.weekOfYear, week2 - week1 > 0  {
                let week = week2 - week1
                if week >= 2 { return String(format: "%d weeks ago".adjustedKey(forValue: week).localized(), week) }
                return numericDates ? "1 week ago".localized() : "Last week".localized()
            } else if let day1 = myDateComponents.day, let day2 = currentDateConponents.day, day2 - day1 >= -1  {
                if let month1 = myDateComponents.month, let month2 = currentDateConponents.month, month2 - month1 >= 0 {
                    let day = day2 - day1
                    if day >= 2 { return String(format: "%d days ago".adjustedKey(forValue: day).localized(), day) }
                    if day == 1 { return numericDates ? "1 day ago".localized() : "Yesterday".localized() }
                    if day == 0 { return "today".localized() }
                    if day == -1 { return "tomorrow".localized() }
                }
            }
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        return dateFormatter.string(from: self)
    }
    
    public func invalid() -> Bool{
        let stringDate = UIHelper.DateToString(date: Date(), dateFormat: TimeFormat.DATE_TIME_UTC_FORMAT)
        let now = UIHelper.StringToDate(date: stringDate, dateFormat: TimeFormat.DATE_TIME_UTC_FORMAT)
        if self < now {
            return true
        }
        return false
    }
}*/
