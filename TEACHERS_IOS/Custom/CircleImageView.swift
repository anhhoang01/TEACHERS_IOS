//
//  GroundImageView.swift
//  TEACHERS_IOS
//
//  Created by mac on 8/28/18.
//  Copyright © 2018 jilnesta. All rights reserved.
//

import Foundation
import UIKit

class CircleImageView: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self._updateCircle()
    }
    private func setupUI() {
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.clear.cgColor
    }
    
    
    fileprivate func _updateCircle() {
        let width = self.bounds.size.width
        let height = self.bounds.size.height
        self.layer.cornerRadius = ceil(max(width, height)/2)
        self.clipsToBounds = true
    }
}
