//
//  BaseTextField.swift
//  TEACHERS_IOS
//
//  Created by mac on 8/21/18.
//  Copyright © 2018 jilnesta. All rights reserved.
//

import Foundation
import UIKit

class BoderTextField: BaseTextField {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
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
        self.becomeFirstResponder()
        
    }
}
