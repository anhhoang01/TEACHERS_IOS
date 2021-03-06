//
//  Teacher_RegisterViewController.swift
//  TEACHERS_IOS
//
//  Created by mac on 8/16/18.
//  Copyright © 2018 jilnesta. All rights reserved.
//

import UIKit

class Teacher_RegisterViewController: BaseViewController , UITextFieldDelegate{
    
    //MARK: - Outlet ..
    @IBOutlet weak var lblLastName: UILabel!
    @IBOutlet weak var lblFirstName: UILabel!
    @IBOutlet weak var lblLastNameEng: UILabel!
    @IBOutlet weak var lblFirstNameEng: UILabel!
    @IBOutlet weak var lblOrtherName: UILabel!
    @IBOutlet weak var lblOrtherAddress: UILabel!
    @IBOutlet weak var lblOrtherPhoneNumber: UILabel!
    @IBOutlet weak var lblLanguageLevel: UILabel!
    @IBOutlet weak var lblSex: UILabel!
    @IBOutlet weak var lblDatePicker: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblPhoneNumber: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblPassword: UILabel!
    @IBOutlet weak var lblRepeatPassword: UILabel!
    @IBOutlet weak var lblAvatar: UILabel!
    @IBOutlet weak var lblJob: UILabel!
    
    @IBOutlet weak var btnSex: UIButton!
    @IBOutlet weak var btnType: UIButton!
    @IBOutlet weak var btnDatePicker: UIButton!
    @IBOutlet weak var btnLanguageLevel: UIButton!
    
    @IBOutlet weak var tfLastName: UITextField!
    @IBOutlet weak var tfFirstName: UITextField!
    @IBOutlet weak var tfLastNameEng: UITextField!
    @IBOutlet weak var tfFirstNameEng: UITextField!
    @IBOutlet weak var tfOrtherName: UITextField!
    @IBOutlet weak var tfOrtherAddress: UITextField!
    @IBOutlet weak var tfOrtherPhoneNumber: UITextField!
    @IBOutlet weak var tfJob: UITextField!
    @IBOutlet weak var tfAge: UITextField!
    @IBOutlet weak var tfAddress: UITextField!
    @IBOutlet weak var tfPhoneNumber: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfRepeatPassword: UITextField!
    
    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var LanguageLevelView: UIView!

    //MARK: Propertie
    private var datePicked = Date()
    var profile : [String:String] = [:]
    //MARK: - Action tapped
    @IBAction func actionLanguageLevel(_ sender: AnyObject) {
        lblLanguageLevel.text = "日本語レベル"
        lblLanguageLevel.textColor = UIColor.black
        self.setupDropdown(dataSource: ["N1", "N2", "N3", "N4"], setLayout: btnLanguageLevel)
    }
    @IBAction func actionSex(_ sender: AnyObject) {
        lblSex.text = "性別"
        lblSex.textColor = .black
        self.setupDropdown(dataSource: ["男","女"], setLayout: btnSex)
    }
    @IBAction func actionDatePicker(_ sender: AnyObject) {
        lblDatePicker.text = "生年月日"
        lblDatePicker.textColor = .black
        datePickerTapped(animated: true, completion: { [weak self] date in
            self?.calculateAge(date: date)
        })
    }
    @IBAction func actionNext(_ sender: AnyObject) {
        actionNextButton()
    }
    @IBAction func actionType (_ sender: AnyObject) {
        lblJob.text = "住所"
        lblJob.textColor = .black
        self.setupDropdown(dataSource: ["FaceBook", "広告", "TVCM", "知人の紹介","その他"], setLayout: btnType)
    }
    //MARK: Viewdidload
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    //MARK: -Setup dropdown
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
    //MARK: -Setup Datepicker
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
    //MARK: PRIVATE FUNCTION
    private func setupUI(){
        self.navigationController?.isNavigationBarHidden = false
        
        let arrTextField : [UITextField] = [tfLastName,tfFirstName,tfLastName,tfFirstNameEng,tfJob,tfAddress,tfPhoneNumber,tfEmail,tfOrtherName,tfOrtherAddress,tfOrtherPhoneNumber,tfPassword,tfRepeatPassword]
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
    private func actionNextButton(){
        if checkIsValid() {
            addProfile()
            let vc = Register_CardIDViewController.nib()
            vc.user = self.profile
            self.navigationController?.pushViewController(vc, animated: true)
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
        
        btnDatePicker.titleLabel?.text = formater.string(from: datePicked)
        tfAge.text = String(describing: age!)
    }
    
    private func checkIsValid() -> Bool{
        // k cho số điện thoại nhập chữ , kí tự đặc biệt -- e mail phải có @ -- k cho pass nhập kí tự đặc biệt -- re pass k cho nhập kí tự đặc biệt
        if (tfLastName.text?.trim().isEmpty)! {
            lblLastName.text = "確認してください。"
            lblLastName.textColor = UIColor.red
            return false
        }else if (tfFirstName.text?.trim().isEmpty)! {
            lblFirstName.text = "確認してください。"
            lblFirstName.textColor = .red
            return false
        }else if (tfFirstName.text?.trim().isEmpty)! {
            lblLastNameEng.text = "確認してください。"
            lblLastNameEng.textColor = .red
            return false
        }else if (tfFirstName.text?.trim().isEmpty)! {
            lblFirstNameEng.text = "確認してください。"
            lblFirstNameEng.textColor = .red
            return false
        }else if btnLanguageLevel.titleLabel?.text?.trim() == "選択してください" {
            lblLanguageLevel.text = "確認してください。language"
            lblLanguageLevel.textColor = UIColor.red
            return false
        }else if btnSex.titleLabel?.text?.trim() == "選択してください" {
            lblSex.text = "確認してください。sex"
            lblSex.textColor = UIColor.red
            return false
        }else if btnDatePicker.titleLabel?.text?.trim() == "選択してください" {
            lblDatePicker.text = "確認してください。date"
            lblDatePicker.textColor = UIColor.red
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
        }else if tfPassword.text?.trim() != tfRepeatPassword.text?.trim() {
            return false
        }
        return true
    }
    //MARK: - Check valid field
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
    
    private func addProfile() {
        profile["lastname"] = tfLastName.text?.trim()
        profile["firstname"] = tfFirstName.text?.trim()
        profile["lastnameEng"] = tfLastNameEng.text?.trim()
        profile["firstnameEng"] = tfFirstNameEng.text?.trim()
        profile["job"] = tfJob.text?.trim()
        profile["languageLevel"] = btnLanguageLevel.titleLabel!.text!.trim()
        profile["sex"] = btnSex.titleLabel?.text?.trim()
        profile["birthday"] = btnDatePicker.titleLabel?.text?.trim()
        profile["job"] = tfJob.text?.trim()
        profile["address"] = tfAddress.text?.trim()
        profile["phonenumber"] = tfPhoneNumber.text?.trim()
        profile["email"] = tfEmail.text?.trim()
        profile["ortherName"] = tfOrtherName.text?.trim()
        profile["ortherAddress"] = tfOrtherAddress.text?.trim()
        profile["ortherphonenumber"] = tfOrtherPhoneNumber.text?.trim()
        profile["pass"] = tfPassword.text?.trim()
    }
    
    //MARK: TEXTFIELD delegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let arrTextField : [UITextField] = [tfLastName,tfFirstName,tfLastNameEng,tfFirstNameEng,tfJob,tfAddress,tfPhoneNumber,tfEmail,tfOrtherName,tfOrtherAddress,tfOrtherPhoneNumber,tfPassword,tfRepeatPassword]
        let arrLabel: [UILabel] = [lblLastName,lblFirstName,lblLastNameEng,lblFirstNameEng,lblJob,lblAddress,lblPhoneNumber,lblEmail,lblOrtherName,lblOrtherAddress,lblOrtherPhoneNumber,lblPassword,lblRepeatPassword]
        let arrText = ["名字","名前","英語名字","英語名前","住所","住所","電話番号","メールアドレス","その他連絡先名前","その他連絡先住所","その他連絡先電話番号","パスワード","パスワード確認"]
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
        
        // Try to find next responder
//        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
//            nextField.becomeFirstResponder()
//        } else {
            // Not found, so remove keyboard.
            textField.resignFirstResponder()
//        }
        return false
    }
}
