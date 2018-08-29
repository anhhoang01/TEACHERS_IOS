//
//  Student_profile_editViewController.swift
//  TEACHERS_IOS
//
//  Created by mac on 8/24/18.
//  Copyright © 2018 jilnesta. All rights reserved.
//

import UIKit

class Student_profile_editViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    //MARK: OUTLET
    @IBOutlet weak var tfFullname: UITextField!
    @IBOutlet weak var tfSex: UITextField!
    @IBOutlet weak var tfBirthday: UITextField!
    @IBOutlet weak var tfAge: UITextField!
    @IBOutlet weak var tvAddress: UITextView!
    @IBOutlet weak var tfPhoneNumber: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    //MARK: PRIVATE FUNCTION
    private func setupUI(){
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Left", style: .plain, target: self, action: #selector(showLeftView(sender:)))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Right", style: .plain, target: self, action: nil)
    }
    @objc private func showLeftView(sender: AnyObject?) {
        sideMenuController?.showLeftView(animated: true, completionHandler: nil)
    }
    private func calculateAge (date:Date) {
        let now = Date()
        let formater = DateFormatter()
        formater.dateFormat = TimeFormat.MONTH_DATE_YEAR_FORMAT
        formater.locale = Locale(identifier: "en_US_POSIX")
        let calendar : Calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: date, to: now)
        let age = ageComponents.year
        tfAge.text = String(describing: age!)
    }
    @IBAction func actionChangePass(_ sender: AnyObject) {
        let vc = Change_passwordViewController.nib()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    

}
