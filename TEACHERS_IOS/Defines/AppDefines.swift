//
//  AppDefines.swift
//  TEACHERS_IOS
//
//  Created by mac on 8/24/18.
//  Copyright © 2018 jilnesta. All rights reserved.
//

import Foundation
import UIKit
import LGSideMenuController

func m_string(_ key: String) -> String {
    return NSLocalizedString(key, tableName: nil, bundle: Bundle.main, value: "", comment: "")
}
let kUserDefault                        = UserDefaults.standard
//MARK: user default key

let kuser                                = "kuserlogin"
let kDevice                             = UIDevice.current
let kNotificationCenter                 = NotificationCenter.default
let kFileManager                        = FileManager.default
let kMainQueue                          = OperationQueue.main
let kAppDelegate                        = UIApplication.shared.delegate as! AppDelegate
let kWindow                             = UIApplication.shared.windows.first!
var kRootViewController                 = UIApplication.shared.delegate?.window??.rootViewController
let kScreenSize                         = UIScreen.main.bounds.size
let kStatusBarFrame                     = UIApplication.shared.statusBarFrame
//let kMainContext                        = NSManagedObjectContext.mr_default()
let kAPI_KEY                            = ""

let kIdAppStore                         = ""

//color
let kGreenColor                         = UIColor(hex: "83d238")
let kBlueColor                          = UIColor(hex: "0FC0EA")
let kVioletColor                        = UIColor(hex: "B376FF")
let kRedColor                           = UIColor(hex: "e53935")
let kLightGrayColor                     = UIColor.lightGray
let kGreenLine                          = UIColor(hex: "A5BCA8")
let kDarkGray                           = UIColor(hex: "EBEBEB")
let kDrakGrayBoder                      = UIColor(hex: "424242")
let kGreenBackGroundButton              = UIColor(hex: "62BE4D")
let kDarkGrayBackGroundDisableTextfield = UIColor(hex: "D3D3D3")
//let ServiceUrl                          =

//user default key
let kUserType                           = "kUserType"
let kAccessToken                        = "kAccessToken"
let kUserId                             = "kUserId"
let kLogged                             = "kLogged"
let kShiftIsStarted                     = "kShiftIsStarted"
let kServer                             = "kServer"
let kTimeStartShift                     = "kTimeStartShift"
let kTimeIdle                           = "kTimeIdle"
let kDateIdle                           = "kDateIdle"
let kUUID                               = "kUUID"
let kRouteDic                           = "kRouteDic"
let kOldLocation                        = "kOldLocation"

