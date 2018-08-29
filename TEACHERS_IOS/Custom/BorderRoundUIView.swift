
//
//  BorderRoundUIView.swift
//  TEACHERS_IOS
//
//  Created by mac on 8/28/18.
//  Copyright © 2018 jilnesta. All rights reserved.
//

import Foundation
import UIKit

class BorderRoundUIView: UIView {
    @IBInspectable var background: UIColor = .white {
        didSet{
            self.backgroundColor = background
        }
    }
    @IBInspectable var borderColor: UIColor = .white {
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
    @IBInspectable var borderSize: CGFloat = 0 {
        didSet{
             self.layer.cornerRadius = borderSize
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
        self.layer.borderWidth = 1       
        self.layer.masksToBounds = false
        self.clipsToBounds = true
    }
}
