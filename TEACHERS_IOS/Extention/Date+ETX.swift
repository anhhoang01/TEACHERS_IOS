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
