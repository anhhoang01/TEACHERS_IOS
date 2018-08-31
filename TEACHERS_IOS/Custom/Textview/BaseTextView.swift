//
//  BaseTextView.swift
//  TEACHERS_IOS
//
//  Created by mac on 8/24/18.
//  Copyright © 2018 jilnesta. All rights reserved.
//

import Foundation
import UIKit

class BaseTextView: UITextView {
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    private func setupUI() {

        self.layer.cornerRadius = 7
        self.layer.borderWidth = 1
        self.layer.borderColor = kDrakGrayBoder.cgColor
        self.backgroundColor = kDarkGray
        self.textColor = UIColor.darkGray
        if #available(iOS 8.2, *) {
            self.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        } else {
            self.font = UIFont(name: "HelveticaNeue-Medium", size: 16)
        }
        
    }
}
