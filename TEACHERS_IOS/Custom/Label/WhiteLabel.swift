//
//  WhiteLabel.swift
//  TEACHERS_IOS
//
//  Created by mac on 8/23/18.
//  Copyright © 2018 jilnesta. All rights reserved.
//

import Foundation
import UIKit

class WhiteLabel: UILabel {
    @IBInspectable var fontSize: CGFloat = 20 {
        didSet {
            if #available(iOS 8.2, *) {
                self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
            } else {
                self.font = UIFont.boldSystemFont(ofSize: fontSize)
            }
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
        self.textColor = UIColor.white  
    }
}