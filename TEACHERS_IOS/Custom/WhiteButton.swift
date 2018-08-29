//
//  WhiteButton.swift
//  TEACHERS_IOS
//
//  Created by mac on 8/21/18.
//  Copyright © 2018 jilnesta. All rights reserved.
//

import Foundation
import UIKit
class WhiteButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    private func setupUI() {
        
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.white.cgColor
        self.backgroundColor = UIColor.white
        self.setTitleColor(UIColor.red, for: .normal)
        if #available(iOS 8.2, *) {
            self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        } else {
            self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        }
        
    }
    
}
