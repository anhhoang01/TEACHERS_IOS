//
//  Change_passwordViewController.swift
//  TEACHERS_IOS
//
//  Created by mac on 8/24/18.
//  Copyright © 2018 jilnesta. All rights reserved.
//

import UIKit

class Change_passwordViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    //MARK: OUTLET
    
    @IBOutlet weak var lblNowPassword: UITextField!
    @IBOutlet weak var lblNewPassword: UITextField!
    @IBOutlet weak var lblRepeatPassword: UITextField!
    
    //MARK: PRIVATE FUNCTION
    private func checkIsValid() -> Bool {
        // check now password = lblnowpassword
        if isValidPassword(textString: (lblNewPassword.text?.trim())!) == false {
            return false
        } else if lblRepeatPassword.text?.trim() != lblNewPassword.text?.trim() {
            return false
        }
        return true
    }
    private func isValidPassword(textString:String) -> Bool {
        if textString.isEmpty == true {
            return false
        } else if ValidatedHelper.isValidatePassword(textString) == false {
            return false
        }
        return true
    }

}
