//
//  BaseSegmentedController.swift
//  TEACHERS_IOS
//
//  Created by mac on 8/27/18.
//  Copyright © 2018 jilnesta. All rights reserved.
//

import Foundation
import UIKit

protocol WMSegmentedControlDelegate:class {
    func getSegmentIndex(index:Int)
}

class WMSegmentedControl: UISegmentedControl {
    
    weak var delegate:WMSegmentedControlDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    func setupUI() {
        self.selectedSegmentIndex = 1
        setupUISegmentedControl(index: 1)
        self.setTitleTextAttributes([NSAttributedStringKey.font:  UIFont.systemFont(ofSize: 15)], for: .normal)
        self.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.black], for: UIControlState.normal)
        self.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
    }
    
    @objc private func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        setupUISegmentedControl(index: sender.selectedSegmentIndex)
        delegate?.getSegmentIndex(index: sender.selectedSegmentIndex)
    }
    
    private func setupUISegmentedControl(index:Int) {
        switch index {
        case 0:
            let subViewOfSegment1: UIView = self.subviews[1] as UIView
            subViewOfSegment1.tintColor = kRedColor
            
            let subViewOfSegment2: UIView = self.subviews[0] as UIView
            subViewOfSegment2.tintColor = kLightGrayColor
        default:
            let subViewOfSegment1: UIView = self.subviews[1] as UIView
            subViewOfSegment1.tintColor = kLightGrayColor
            
            let subViewOfSegment2: UIView = self.subviews[0] as UIView
            subViewOfSegment2.tintColor = kGreenColor
        }
        
    }
    
}
