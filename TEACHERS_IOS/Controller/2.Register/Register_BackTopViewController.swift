//
//  Teacher_Register_BackTopViewController.swift
//  TEACHERS_IOS
//
//  Created by mac on 8/23/18.
//  Copyright © 2018 jilnesta. All rights reserved.
//

import UIKit

class Register_BackTopViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func actionBackLoginPage(){
        self.navigationController?.popToRootViewController(animated: true)
    }

    

}
