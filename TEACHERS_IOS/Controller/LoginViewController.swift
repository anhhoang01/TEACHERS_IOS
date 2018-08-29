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
class LoginViewController: BaseViewController {

    
    //MARk: OUTLET
    @IBOutlet weak var lblLogo: UILabel!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    //MARK: OVERRIDE FUNC
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    
    //MARK: PROPERTIES
    var userType = [String:String]()
    //MARK: ACTION TAPPED
    @IBAction func actionForgot_password(){
        let vc = Forgot_passwordViewController.nib()
        self.navigationController?.pushViewController(vc, animated: true)
       
        
    }
    
    @IBAction func actionRegister_teacher(){
        let vc = RegisterViewController.nib()
        self.navigationController?.pushViewController(vc, animated: true)
        userType["typeUser"] = "1"
        vc.profile = self.userType
    }
    
    @IBAction func actionRegister_student(){
        let vc = RegisterViewController.nib()
        self.navigationController?.pushViewController(vc, animated: true)
        userType["typeUser"] = "2"
        vc.profile = self.userType
    }
    @IBAction func actionLogin(){
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
    //MARK: PRIVATE FUNC
    private func setupUI(){
        self.navigationController?.isNavigationBarHidden = true
        lblLogo.text = "MANABU /NKUN"
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
    
    
    
}
