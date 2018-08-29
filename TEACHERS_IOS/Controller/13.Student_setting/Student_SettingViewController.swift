//
//  Student_SettingViewController.swift
//  TEACHERS_IOS
//
//  Created by mac on 8/24/18.
//  Copyright © 2018 jilnesta. All rights reserved.
//

import UIKit

class Student_SettingViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    private func setupUI(){
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Left", style: .plain, target: self, action: #selector(showLeftView(sender:)))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Right", style: .plain, target: self, action: nil)
    }
    @objc private func showLeftView(sender: AnyObject?) {
        sideMenuController?.showLeftView(animated: true, completionHandler: nil)
    }
    

}
