//
//  BackgroundSideViewController.swift
//  TEACHERS_IOS
//
//  Created by mac on 8/24/18.
//  Copyright © 2018 jilnesta. All rights reserved.
//

import UIKit
import LGSideMenuController
class BackgroundSideViewController : LGSideMenuController   {
    static let shared = BackgroundSideViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.isLeftViewSwipeGestureEnabled = true
        isRootViewStatusBarHidden = false
        rootViewStatusBarStyle = .default
        rootViewStatusBarUpdateAnimation = .none
    }
    
    override func leftViewWillLayoutSubviews(with size: CGSize) {
        super.leftViewWillLayoutSubviews(with: size)
        if isLeftViewStatusBarHidden {
            leftView?.frame = CGRect(x: 0.0, y: -8, width: size.width, height: size.height+8)
        }
    }
    
    override func rootViewWillLayoutSubviews(with size: CGSize) {
        self.rootView?.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
    }
    
    override var isLeftViewStatusBarHidden: Bool {
        get {
            
            return super.isLeftViewStatusBarHidden
        }
        
        set {
            super.isLeftViewStatusBarHidden = newValue
        }
    }
    
    override var isRootViewStatusBarHidden : Bool {
        get { return false }
        set { super.isRootViewStatusBarHidden = newValue }
    }
    
    override var rootViewStatusBarStyle : UIStatusBarStyle {
        get { return .default }
        set { super.rootViewStatusBarStyle = newValue }
    }
    
    override var rootViewStatusBarUpdateAnimation : UIStatusBarAnimation {
        get {
            if isLeftViewVisible {
                return .slide
            }
            else if isRightViewVisible {
                return .fade
            }
            else {
                return .none
            }
        }
        
        set { super.rootViewStatusBarUpdateAnimation = newValue }
        
    }
    
    func setupMenu() {
        let menu = MenuTableViewController.nib()
        let navMenu = BaseNavigationController(rootViewController: menu)
        leftViewController = navMenu
        leftViewWidth = UIScreen.main.bounds.size.width * 0.7
        leftViewPresentationStyle = .slideBelow
        
    }
}
