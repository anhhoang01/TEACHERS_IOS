//
//  Teacher_RegisterViewController.swift
//  TEACHERS_IOS
//
//  Created by mac on 8/16/18.
//  Copyright © 2018 jilnesta. All rights reserved.
//

import UIKit

class RegisterViewController: BaseViewController , UITextFieldDelegate{
    
    //MARK: - Outlet ..
    @IBOutlet weak var lblFullname: UILabel!
    @IBOutlet weak var tfFullname: UITextField!
    @IBOutlet weak var lblLanguageLevel: UILabel!
    @IBOutlet weak var btnLanguageLevel: UIButton!
    @IBOutlet weak var lblSex: UILabel!
    @IBOutlet weak var btnSex: UIButton!
    @IBOutlet weak var lblDatePicker: UILabel!
    @IBOutlet weak var btnDatePicker: UIButton!
    @IBOutlet weak var tfAge: UITextField!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var tfAddress: UITextField!
    @IBOutlet weak var lblPhoneNumber: UILabel!
    @IBOutlet weak var tfPhoneNumber: UITextField!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var lblPassword: UILabel!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var lblRepeatPassword: UILabel!
    @IBOutlet weak var tfRepeatPassword: UITextField!
    @IBOutlet weak var LanguageLevelView: UIView!
    //MARK: Propertie
    private var datePicked = Date()
    var profile = [String:String]()
    //MARK: - Action tapped
    @IBAction func actionLanguageLevel(_ sender: AnyObject) {
        lblLanguageLevel.text = "日本語レベル"
        lblLanguageLevel.textColor = UIColor.black
        self.setupDropdown(dataSource: ["N1", "N2", "N3", "N4"], setLayout: btnLanguageLevel)
    }
    @IBAction func actionSex(_ sender: AnyObject) {
        lblSex.text = "性別"
        lblSex.textColor = UIColor.black
        self.setupDropdown(dataSource: ["男","女"], setLayout: btnSex)
    }
    @IBAction func actionDatePicker(_ sender: AnyObject) {
        lblDatePicker.text = "生年月日"
        lblDatePicker.textColor = UIColor.black
        datePickerTapped(animated: true, completion: { [weak self] date in
            self?.calculateAge(date: date)
        })
    }
    @IBAction func actionNext(_ sender: AnyObject) {
        actionNextButton()
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
        let arrTextField : [UITextField] = [tfFullname,tfAddress,tfPhoneNumber,tfEmail,tfPassword,tfRepeatPassword]
        for textfield in arrTextField {
            textfield.delegate = self
        }
        
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
        if tfFullname.text == "" {
            lblFullname.text = "確認してください。"
            lblFullname.textColor = UIColor.red
            return false
        }else if btnLanguageLevel.titleLabel?.text == "選択してください" {
            lblLanguageLevel.text = "確認してください。language"
            lblLanguageLevel.textColor = UIColor.red
            return false
        }else if btnSex.titleLabel?.text == "選択してください" {
            lblSex.text = "確認してください。sex"
            lblSex.textColor = UIColor.red
            return false
        }else if btnDatePicker.titleLabel?.text == "選択してください" {
            lblDatePicker.text = "確認してください。date"
            lblDatePicker.textColor = UIColor.red
            return false
        }else if tfAddress.text == "" {
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
    
    private func getDefaultLabel(){
        // xử dụng khi click vào textfield nào thì label đó reset
        let arrLabel: [UILabel] = [lblFullname,lblLanguageLevel,lblSex,lblDatePicker,lblAddress,lblPhoneNumber,lblEmail,lblPassword,lblRepeatPassword]
        let arrText = ["名前","日本語レベル","性別","生年月日","年齢","住所","電話番号","メールアドレス","パスワード","パスワード確認"]
        arrLabel.enumerated().forEach { arg in
            arg.element.text = arrText[arg.offset]
            arg.element.textColor = UIColor.black
        }
    }
    private func addProfile() {
        profile["fullname"] = tfFullname.text?.trim()
        profile["languageLevel"] = btnLanguageLevel.titleLabel!.text!.trim()
        profile["sex"] = btnSex.titleLabel?.text?.trim()
        profile["birthday"] = btnDatePicker.titleLabel?.text?.trim()
        profile["age"] = tfAge.text?.trim()
        profile["address"] = tfAddress.text?.trim()
        profile["phonenumber"] = tfPhoneNumber.text?.trim()
        profile["email"] = tfEmail.text?.trim()
        profile["pass"] = tfPassword.text?.trim()
    }
    
    //MARK: TEXTFIELD delegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let arrTextField : [UITextField] = [tfFullname,tfAddress,tfPhoneNumber,tfEmail,tfPassword,tfRepeatPassword]
        let arrLabel: [UILabel] = [lblFullname,lblAddress,lblPhoneNumber,lblEmail,lblPassword,lblRepeatPassword]
        let arrText = ["名前","住所","電話番号","メールアドレス","パスワード","パスワード確認"]
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
            let allowedCharacters = CharacterSet(charactersIn:"0123456789 ")
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }        
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        // Try to find next responder
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            // Not found, so remove keyboard.
            textField.resignFirstResponder()
            actionNextButton()
        }
        return false
    }
    
    
    
    
}
