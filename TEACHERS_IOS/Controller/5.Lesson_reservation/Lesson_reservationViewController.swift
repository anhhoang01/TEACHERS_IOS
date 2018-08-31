//
//  Lesson_reservationViewController.swift
//  TEACHERS_IOS
//
//  Created by mac on 8/24/18.
//  Copyright © 2018 jilnesta. All rights reserved.
//

import UIKit
import GooglePlaces

class Lesson_reservationViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: OUTLET
    @IBOutlet weak var heightViewSearch: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblDatePicker: UILabel!
    @IBOutlet weak var searchView: UIView!
    private var datePicked = Date()
    //MARK: ACTION TAPPED
    @IBAction func actionShow7Date(_ sender: AnyObject) {
        datePickerTapped(animated: true, completion: { [weak self] date in
            let formater = DateFormatter()
            formater.dateFormat = TimeFormat.MONTH_DATE_YEAR_FORMAT
            self?.lblDatePicker.text = formater.string(from: (self?.datePicked)!)
        })
    }
    @IBAction func actionSearch(_ sender: AnyObject) {
        
    }
    //MARK: PRIVATE FUNCTION
    private func setupUI(){
        heightViewSearch.constant = 0
        tableView.register(Lesson_reservationTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Right", style: .plain, target: self, action: #selector(actionShowSearch(_:)))
    }
    //MARK: SETUP DATEPICKER
    private func datePickerTapped(animated flag: Bool, completion: @escaping (_ date: Date) -> Void) {
        let minDate = Date(dateString: "12/27/1900")
        var dateComponents = DateComponents()
        dateComponents.day = +7
        let sevenDayNext = Calendar.current.date(byAdding: dateComponents, to: minDate)
        let datePicker = DatePickerDialog(textColor: .red,
                                          buttonColor: .red,
                                          font: UIFont.boldSystemFont(ofSize: 17),
                                          showCancelButton: true)
        datePicker.show("DatePickerDialog",
                        doneButtonTitle: "Done",
                        cancelButtonTitle: "Cancel",
                        minimumDate: minDate,
                        maximumDate: sevenDayNext,
                        datePickerMode: .date) { (date) in
                            if let dt = date {
                                self.datePicked  = dt
                                completion(dt)
                            }
        }
    }
    @objc private func actionShowSearch(_ sender: UIButton) {
       
        
    }
    
}
extension Lesson_reservationViewController : UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as Lesson_reservationTableViewCell
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension;
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
   
}

