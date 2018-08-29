//
//  DisableTextfield.swift
//  TEACHERS_IOS
//
//  Created by mac on 8/24/18.
//  Copyright © 2018 jilnesta. All rights reserved.
//

import Foundation
import UIKit

class DisableTextfield: BoderTextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    private func setupUI() {
        let colorBackground = hexStringToUIColor(hex: "D3D3D3")
        self.backgroundColor = colorBackground
        self.textColor = UIColor.black
        self.isEnabled = false
    }
}
