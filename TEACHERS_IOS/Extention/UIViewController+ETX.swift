//
//  UIViewController+ETX.swift
//  TEACHERS_IOS
//
//  Created by mac on 8/24/18.
//  Copyright © 2018 jilnesta. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    public class func nib() -> Self {
        return self.init(nibName: String(describing: self), bundle: nil)
    }
}
