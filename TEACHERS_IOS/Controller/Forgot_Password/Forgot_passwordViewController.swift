//
//  Forgot_passwordViewController.swift
//  TEACHERS_IOS
//
//  Created by mac on 8/16/18.
//  Copyright © 2018 jilnesta. All rights reserved.
//

import UIKit

class Forgot_passwordViewController: BaseViewController {

    //MARK: OUTLET
    @IBOutlet weak var tfEmail: UITextField!
    //MARK: ACTION TAPPED
    @IBAction func actionGetNewPass(){
        let alert = UIAlertController(title: "TEACHERS", message: "ERROR", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "NO", style: .cancel))
        alert.addAction(UIAlertAction(title: "YES", style: .default, handler: {action in
            self.navigationController?.popViewController(animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    //MARK: OVERRIDE FUNCTION
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    //MARK: PRIVATE FUNCTION
    private func setupUI(){
        self.navigationController?.navigationItem.title = "abc"
        
    }
    
    
    

}
