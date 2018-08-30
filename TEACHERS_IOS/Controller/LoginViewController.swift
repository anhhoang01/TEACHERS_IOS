//
//  LoginViewController.swift
//  TEACHERS_IOS
//
//  Created by mac on 8/16/18.
//  Copyright © 2018 jilnesta. All rights reserved.
//

import UIKit
enum UserType {
    case Student
    case Teacher
}
class LoginViewController: BaseViewController, UITextFieldDelegate {

    
    //MARk: OUTLET
    @IBOutlet weak var lblLogo: UILabel!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    //MARK: OVERRIDE FUNC
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    //MARK: PROPERTIES
    var userType = [String:String]()
    var arrTextfield : [UITextField] = []
    //MARK: ACTION TAPPED
    @IBAction func actionForgot_password(){
        arrTextfield.enumerated().forEach{
            $0.element.resignFirstResponder()
        }
        let vc = Forgot_passwordViewController.nib()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func actionRegister_teacher(){
        arrTextfield.enumerated().forEach{
            $0.element.resignFirstResponder()
        }
        let vc = Teacher_RegisterViewController.nib()
        self.navigationController?.pushViewController(vc, animated: true)
        userType["typeUser"] = "1"
        vc.profile = self.userType
    }
    
    @IBAction func actionRegister_student(){
        arrTextfield.enumerated().forEach{
            $0.element.resignFirstResponder()
        }
        let vc = Student_RegisterViewController.nib()
        self.navigationController?.pushViewController(vc, animated: true)
        userType["typeUser"] = "2"
        //vc.profile = self.userType
    }
    @IBAction func actionLogin(){
        loginUser()
    }
    //MARK: PRIVATE FUNC
    private func setupUI(){
        self.navigationController?.isNavigationBarHidden = true
        lblLogo.text = "MANABU /NKUN"
        arrTextfield.append(tfEmail)
        arrTextfield.append(tfPassword)
        arrTextfield.enumerated().forEach{
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
    private func checkLogin() -> Bool{
        if (tfEmail.text == "") {
            return false
        }else if tfPassword.text == ""{
            return false
        }else {
            //call api
            //user.email = tfemail.text user.pass = tfpass.text
            //completion
            if (tfEmail.text == "abc" && tfPassword.text == "123"){
                kUserDefault.set(true, forKey: kuser)
                
                return true
            }
        }        
        return false
    }
    private func loginUser(){
        if checkLogin(){
            let viewcontroller = Student_toppageViewController.nib()
            let navigation = BaseNavigationController(rootViewController: viewcontroller)
            let mainviewcontroller = BackgroundSideViewController()
            mainviewcontroller.rootViewController = navigation
            mainviewcontroller.setupMenu()
            if let window = UIApplication.shared.keyWindow {
                window.rootViewController = mainviewcontroller
                kRootViewController = mainviewcontroller
                
            }
        }
    }
    //MARK: Textfield degelate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        // Try to find next responder
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            // Not found, so remove keyboard.
            textField.resignFirstResponder()
            loginUser()
        }
        return false
    }
}
