//
//  ValidLabel.swift
//  TEACHERS_IOS
//
//  Created by mac on 8/22/18.
//  Copyright © 2018 jilnesta. All rights reserved.
//

import Foundation
import UIKit

class ValidLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    private func setupUI() {
        self.textColor = UIColor.black
        if #available(iOS 8.2, *) {
            self.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        } else {
            self.font = UIFont(name: "HelveticaNeue-Medium", size: 16)
        }
    }
}
