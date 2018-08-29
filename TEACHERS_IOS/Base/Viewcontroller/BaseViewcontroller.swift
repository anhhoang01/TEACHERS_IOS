//
//  BaseViewcontroller.swift
//  TEACHERS_IOS
//
//  Created by mac on 8/27/18.
//  Copyright © 2018 jilnesta. All rights reserved.
//

import Foundation
import UIKit
import LGSideMenuController

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNav()
        // Do any additional setup after loading the view.
    }
    
    func setupNav() {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.barTintColor = .red
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white ,
                                                                        NSAttributedStringKey.font: UIFont(name: "HelveticaNeue-Medium", size: 20)!]
    }
    
    func setupBackButton() {
        let barButton = createBarButtonItem(action: #selector(popViewControler))
        self.navigationItem.leftBarButtonItem = barButton
    }
    
    func setupDismissButton() {
        let barButton = createBarButtonItem(action: #selector(dismissVC))
        self.navigationItem.leftBarButtonItem = barButton
    }
    
    func createBarButtonItem(action: Selector) -> UIBarButtonItem {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "ic_back"), for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 50, height: 30)
        button.addTarget(self, action: action, for: .touchUpInside)
        button.imageView?.contentMode = .scaleAspectFit
        button.contentEdgeInsets = UIEdgeInsets.init(top: 0, left: -30, bottom: 0, right: 0)
        return UIBarButtonItem.init(customView: button)
    }
    
    @objc func popViewControler() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func dismissVC(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func popToRootViewController() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func enableMenuSwipe(_ check:Bool) {
        let mainViewController = sideMenuController!
        mainViewController.isLeftViewSwipeGestureEnabled = check
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = !check
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
    
    @objc func hideKeyBoard()  {
        self.view.endEditing(true)
    }
    
}
