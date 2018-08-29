//
//  Notification+ETX.swift
//  TEACHERS_IOS
//
//  Created by mac on 8/23/18.
//  Copyright © 2018 jilnesta. All rights reserved.
//

import Foundation
import UIKit

extension Notification.Name {
    // start - stop shift
    static let startShiftFromSlider = Notification.Name("startShiftFromSlider")
    static let startShiftFromMenu = Notification.Name("startShiftFromMenu")
    static let endShift = Notification.Name("endShift")
    static let endShiftSuccess = Notification.Name("endShiftSuccess")
    static let startShiftSuccess = Notification.Name("startShiftSuccess")
    
    //reload list task
    static let isReachable = Notification.Name("isReachable")
    static let Reload = Notification.Name.UIApplicationWillEnterForeground
    
    
}
