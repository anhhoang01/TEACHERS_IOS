//
//  BorderUIView.swift
//  TEACHERS_IOS
//
//  Created by mac on 8/23/18.
//  Copyright © 2018 jilnesta. All rights reserved.
//

import Foundation
import UIKit

class BorderUIView: UIView {
    var topBorder = CALayer()
    var leftBorder = CALayer()
    @IBInspectable var isBorderLeft:Bool = false {
        didSet{
            
            if self.isBorderLeft == true {
                self.layer.addSublayer(leftBorder)
            }
            else {
                
            }
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self._setupUI()
    }
    
    private func _setupUI(){
        topBorder.frame = CGRect(x: 0, y: self.frame.size.height , width: self.frame.size.width, height: 1)        
        leftBorder.frame = CGRect(x: 0, y: 0, width: 1, height: self.frame.size.height)
        self.topBorder.backgroundColor = UIColor.white.cgColor
        self.leftBorder.backgroundColor = UIColor.white.cgColor
        self.layer.addSublayer(topBorder)
        
        
    }
}

