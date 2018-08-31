
//
//  File.swift
//  TEACHERS_IOS
//
//  Created by mac on 8/21/18.
//  Copyright © 2018 jilnesta. All rights reserved.
//

import Foundation
import UIKit

class DropDownButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 7 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable var borderColor: Bool = true {
        didSet {
            if borderColor == true {
                self.layer.borderColor = kDrakGrayBoder.cgColor
                
            }else {
                self.layer.borderColor = UIColor.clear.cgColor
            }
            self.layer.borderWidth = 1
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    private func setupUI() {

        
        self.backgroundColor = kDarkGray
        self.setTitleColor(UIColor.darkGray, for: .normal)
        if #available(iOS 8.2, *) {
            self.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        } else {
            self.titleLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 16)
        }
        self.titleEdgeInsets.left = 10
        
    }
    
    
}

