//
//  BaseSegMentedController.swift
//  TEACHERS_IOS
//
//  Created by mac on 8/27/18.
//  Copyright © 2018 jilnesta. All rights reserved.
//

import Foundation
import UIKit
import PureLayout

protocol BaseSliderDelegate:class {
    func BaseSliderValueChanged(slider: UISlider)
}

enum SliderMode {
    case ListTasks
    case Task
}


class BaseSlider: UISlider {
    
    let lblTitle = UILabel()
    var checkSliderValueForStarted = false
    weak var delegate:BaseSliderDelegate?
    
    var mode:SliderMode? {
        didSet {
            if let mode = self.mode {
                self.setStyleSlider(mode: mode)
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
        self.value = 0
        self.maximumValue = 100
        let img = self.clearPixel()
        self.layer.cornerRadius = self.frame.size.height/2
        self.setMaximumTrackImage(img, for: .normal)
        self.setMinimumTrackImage(img, for: .normal)
        self.addTarget(self, action: #selector(onSliderValChanged(slider:event:)), for: .valueChanged)
        lblTitle.textColor = UIColor.darkGray
        self.addSubview(lblTitle)
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func clearPixel() -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context: CGContext? = UIGraphicsGetCurrentContext()
        context?.setFillColor(UIColor.clear.cgColor)
        context?.fill(rect)
        let image: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image ?? UIImage()
    }
    
    @objc func onSliderValChanged(slider:BaseSlider, event: UIEvent) {
        let currentValue = Int(slider.value)
        if currentValue > 15 {
            self.lblTitle.isHidden = true
        } else {
            self.lblTitle.isHidden = false
        }
        
        if let touchEvent = event.allTouches?.first {
            switch touchEvent.phase {
            case .ended:
                self.refresh()
            default:
                break
            }
        }
        
        if (currentValue > 80 && !checkSliderValueForStarted) {
            print("Done")
            checkSliderValueForStarted = !checkSliderValueForStarted
            delegate?.BaseSliderValueChanged(slider: slider)
            self.refresh()
        }
        
        
    }
    
    private func setStyleSlider(mode:SliderMode) {
        if mode == .ListTasks {
            self.setThumbImage(#imageLiteral(resourceName: "slider-thumb"), for: .normal)
            self.backgroundColor = UIColor(hex: "8C9296")
            lblTitle.text = "Slide to Start Shift"
            if UIScreen.main.bounds.size.width == 320 {
                lblTitle.autoAlignAxis(.vertical, toSameAxisOf: self, withOffset: 15)
                lblTitle.autoAlignAxis(toSuperviewAxis: .horizontal)
            } else {
                lblTitle.autoAlignAxis(toSuperviewAxis: .horizontal)
                lblTitle.autoAlignAxis(toSuperviewAxis: .vertical)
            }
        } else {
            self.setThumbImage(#imageLiteral(resourceName: "slider-thumb-green"), for: .normal)
            self.backgroundColor = UIColor(hex: "DCDCDC")
            lblTitle.text = "Slide to Start"
            lblTitle.autoAlignAxis(toSuperviewAxis: .horizontal)
            lblTitle.autoAlignAxis(toSuperviewAxis: .vertical)
        }
    }
    
    func refresh(){
        self.value = 0
        self.lblTitle.isHidden = false
    }
}
