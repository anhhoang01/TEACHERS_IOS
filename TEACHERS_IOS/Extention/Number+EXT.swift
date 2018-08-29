//
//  Number+EXT.swift
//  wimo-ios
//
//  Created by Unima M2001 on 1/4/18.
//  Copyright © 2018 Unima M2001. All rights reserved.
//

import Foundation
import UIKit

extension Decimal {
    var significantFractionalDecimalDigits: Int {
        return max(-exponent, 0)
    }
}
