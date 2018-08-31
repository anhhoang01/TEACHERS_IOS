//
//  MenuTableTableViewCell.swift
//  TEACHERS_IOS
//
//  Created by mac on 8/24/18.
//  Copyright © 2018 jilnesta. All rights reserved.
//

import UIKit

class MenuTableTableViewCell: UITableViewCell {

    @IBOutlet weak var menuCell: UILabel?
    @IBOutlet weak var lineView: UIView!
    override func layoutSubviews() {
        super.layoutSubviews()
        self._setupUI()
    }
    private func _setupUI(){
        
        lineView.backgroundColor = kGreenLine        
    }
    
}
