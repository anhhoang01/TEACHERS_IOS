//
//  Terms_of_serviceViewController.swift
//  TEACHERS_IOS
//
//  Created by mac on 8/24/18.
//  Copyright © 2018 jilnesta. All rights reserved.
//

import UIKit

class Terms_of_serviceViewController: BaseViewController {

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
