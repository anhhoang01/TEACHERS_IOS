//
//  TextField.swift
//  TEACHERS_IOS
//
//  Created by mac on 8/27/18.
//  Copyright © 2018 jilnesta. All rights reserved.
//

import Foundation
import UIKit

class BaseTextField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    private func setupUI() {
        self.textAlignment = .left
        self.becomeFirstResponder()
        if #available(iOS 8.2, *) {
            self.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        } else {
            self.font = UIFont(name: "HelveticaNeue-Medium", size: 16)
        }
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
}
