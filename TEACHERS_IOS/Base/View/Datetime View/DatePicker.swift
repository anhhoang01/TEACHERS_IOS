//
//  DatePicker.swift
//  TEACHERS_IOS
//
//  Created by mac on 8/27/18.
//  Copyright © 2018 jilnesta. All rights reserved.
//

import Foundation
import UIKit

class DatePicker: UIView {
    
    private var datePicker:UIDatePicker?
    var didSelectedDate:((_ date: String?) -> Void)?
    var dateString:String?{
        didSet {
            if let dateString = dateString {
                let date = UIHelper.StringToDate(date: dateString, dateFormat: TimeFormat.MONTH_DATE_YEAR_FORMAT)
                self.datePicker?.date = date
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
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
//        if let timezone = WMUserManager.shared.currentUser?.company?.companyInfo?.timezone {
//            datePicker.timeZone = TimeZone(identifier: timezone)
//        }
        self.addSubview(datePicker)
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.autoPinEdgesToSuperviewEdges(with: .init(), excludingEdge: .top)
        datePicker.autoSetDimension(.height, toSize: 120)
        datePicker.backgroundColor = .white
        self.datePicker = datePicker
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissViewPicker))
        self.addGestureRecognizer(tap)
    }
    
    func startAnimation(backgroundColor:UIColor?) {
        UIView.animate(withDuration: 0.15, animations: {
            self.backgroundColor = backgroundColor
            self.datePicker?.frame = CGRect(x: 0, y: -kScreenSize.height, width: kScreenSize.width, height: kScreenSize.height)
        }, completion: { (true) -> Void in
            self.backgroundColor = backgroundColor
        })
    }
    
    @objc private func dismissViewPicker() {
        UIView.animate(withDuration: 0.15, animations: {
            self.backgroundColor = .clear
            self.datePicker?.frame = CGRect(x: 0, y: kScreenSize.height, width: kScreenSize.width, height: kScreenSize.height)
        }, completion: { (true) -> Void in
            self.removeFromSuperview()
        })
        if let datePicker = self.datePicker {
            let dateString = UIHelper.DateToString(date: datePicker.date, dateFormat: TimeFormat.MONTH_DATE_YEAR_FORMAT)
            didSelectedDate?(dateString)
        }
    }
}
