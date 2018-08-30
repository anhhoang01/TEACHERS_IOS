//
//  Student_RegisterViewController.swift
//  TEACHERS_IOS
//
//  Created by mac on 8/30/18.
//  Copyright © 2018 jilnesta. All rights reserved.
//

import UIKit

class Student_RegisterViewController: UIViewController , UITextFieldDelegate{

    //MARK: OUTLET
    @IBOutlet weak var lblFullName: UILabel!
    @IBOutlet weak var lblSex: UILabel!
    @IBOutlet weak var lblBirthday: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblPhoneNumber: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblPassword: UILabel!
    @IBOutlet weak var lblRepPassword: UILabel!
    
    @IBOutlet weak var tfFullName: UITextField!
    @IBOutlet weak var btnSex:UIButton!
    @IBOutlet weak var btnBirthday: UIButton!
    @IBOutlet weak var tfAge: UITextField!
    @IBOutlet weak var tfAddress: UITextField!
    @IBOutlet weak var tfPhoneNumber: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfRepPassword: UITextField!
    //MARK: ACTION TAPPED
    @IBAction func actionSex(_ sender: AnyObject) {
        lblSex.text = "性別"
        lblSex.textColor = .black
        self.setupDropdown(dataSource: ["男","女"], setLayout: btnSex)
    }
    @IBAction func actionBirthday(_ sender: AnyObject) {
        lblBirthday.text = "生年月日"
        lblBirthday.textColor = .black
        datePickerTapped(animated: true, completion: { [weak self] date in
            self?.calculateAge(date: date)
        })
    }
    @IBAction func actionNext(_ sender: AnyObject) {
        if checkIsValid() {
            let vc = Register_CardIDViewController.nib()
            self.navigationController?.pushViewController(vc, animated: true)
            addProfile()
            vc.user = self.profile
        }
    }
    //MARK: PROPERTIES
    var profile: [String:String] = [:]
    private var datePicked = Date()
    //MARK: PRIVATE FUNC
    private func setupUI(){
        self.navigationController?.isNavigationBarHidden = false
        let arrTextField : [UITextField] = [tfFullName,tfAddress,tfPhoneNumber,tfEmail,tfPassword,tfRepPassword]
        arrTextField.enumerated().forEach{
            $0.element.delegate = self
        }
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        
        // --cancel touch when tap in view
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    private func setupDropdown(dataSource: [String], setLayout button: UIButton) {
        let chooseDropDown = DropDown()
        chooseDropDown.anchorView = button
        chooseDropDown.bottomOffset = CGPoint(x: 0, y: button.bounds.height)
        chooseDropDown.dataSource = dataSource
        chooseDropDown.width = button.bounds.width
        chooseDropDown.selectionAction = { (index, item) in
            button.setTitle(item, for: .normal)
        }
        chooseDropDown.show()
    }
    private func datePickerTapped(animated flag: Bool, completion: @escaping (_ date: Date) -> Void) {
        let currentDate = Date()
        let minDate = Date(dateString: "1/1/1900")
        
        let datePicker = DatePickerDialog(textColor: .red,
                                          buttonColor: .red,
                                          font: UIFont.boldSystemFont(ofSize: 17),
                                          showCancelButton: true)
        datePicker.show("DatePickerDialog",
                        doneButtonTitle: "Done",
                        cancelButtonTitle: "Cancel",
                        minimumDate: minDate,
                        maximumDate: currentDate,
                        datePickerMode: .date) { (date) in
                            if let dt = date {
                                self.datePicked  = dt
                                completion(dt)
                            }
        }
    }
    private func calculateAge (date:Date) {
        let now = Date()
        let formater = DateFormatter()
        formater.dateFormat = TimeFormat.MONTH_DATE_YEAR_FORMAT
        formater.locale = Locale(identifier: "en_US_POSIX")
        let calendar : Calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: date, to: now)
        let age = ageComponents.year
        
        btnBirthday.titleLabel?.text = formater.string(from: datePicked)
        tfAge.text = String(describing: age!)
    }
    private func addProfile() {
        profile["fullname"] = tfFullName.text?.trim()
        profile["sex"] = btnSex.titleLabel?.text?.trim()
        profile["birthday"] = btnBirthday.titleLabel?.text?.trim()
        profile["address"] = tfAddress.text?.trim()
        profile["phonenumber"] = tfPhoneNumber.text?.trim()
        profile["email"] = tfEmail.text?.trim()
        profile["pass"] = tfPassword.text?.trim()
    }
    //MARK: CHECK VALID 
    private func checkIsValid() -> Bool{
        if (tfFullName.text?.trim().isEmpty)! {
            lblFullName.text = "確認してください。"
            lblFullName.textColor = .red
            return false
        }else if btnSex.titleLabel?.text?.trim() == "選択してください" {
            lblSex.text = "確認してください。sex"
            lblSex.textColor = UIColor.red
            return false
        }else if btnBirthday.titleLabel?.text?.trim() == "選択してください" {
            lblBirthday.text = "確認してください。date"
            lblBirthday.textColor = UIColor.red
            return false
        }else if (tfAddress.text?.trim().isEmpty)! {
            lblAddress.text = "確認してください。address"
            lblAddress.textColor = UIColor.red
            return false
        }else if isValidPhoneNumber(textString: tfPhoneNumber.text!.trim()) == false  {
            return false
        }else if isValidEmail(textStr: tfEmail.text!.trim()) == false {
            return false
        }else if isValidPassword(textString: tfPassword.text!.trim()) == false {
            return false
        }else if tfPassword.text?.trim() != tfRepPassword.text?.trim() {
            return false
        }
        return true
    }
    private func isValidEmail(textStr:String) -> Bool {
        if textStr.isEmpty == true {
            lblEmail.text = "確認してください。email empty"
            lblEmail.textColor = UIColor.red
            return false
        } else if ValidatedHelper.isValidEmail(textStr) == false {
            lblEmail.text = "確認してください。email valid"
            lblEmail.textColor = UIColor.red
            return false
        }
        return true
    }
    
    private func isValidPhoneNumber(textString:String) -> Bool {
        if textString.isEmpty == true {
            lblPhoneNumber.text = "確認してください。phone empty"
            lblPhoneNumber.textColor = UIColor.red
            return false
        } else if ValidatedHelper.isValidatePhoneNumber(textString) == false {
            lblPhoneNumber.text = "確認してください。phone valid"
            lblPhoneNumber.textColor = UIColor.red
            return false
        }
        return true
    }
    private func isValidPassword(textString:String) -> Bool {
        if textString.isEmpty == true {
            lblPassword.text = "確認してください。pass empty"
            lblPassword.textColor = UIColor.red
            return false
        } else if ValidatedHelper.isValidatePassword(textString) == false {
            lblPassword.text = "確認してください。pass valid"
            lblPassword.textColor = UIColor.red
            return false
        }
        return true
    }
    //MARK: TEXTFIELD DELEGATE
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let arrTextField : [UITextField] = [tfFullName,tfAddress,tfPhoneNumber,tfEmail,tfPassword,tfRepPassword]
        let arrLabel: [UILabel] = [lblFullName,lblAddress,lblPhoneNumber,lblEmail,lblPassword,lblRepPassword]
        let arrText = ["FULL","ADD","PHONE","EMAIL","PASS","REP PASS"]
        for i in 0..<arrTextField.count {
            if textField == arrTextField[i] {
                arrLabel[i].text = arrText[i]
                arrLabel[i].textColor = UIColor.black
            }
        }
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.isEmpty {
            return true
        }
        if (textField == self.tfPhoneNumber) {
            let allowedCharacters = CharacterSet(charactersIn:"0123456789")
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return false
    }
    //MARK: OVERRIDE FUNCTION
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
   

}
