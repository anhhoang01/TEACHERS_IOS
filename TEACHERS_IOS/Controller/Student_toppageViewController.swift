//
//  Student_toppageViewController.swift
//  TEACHERS_IOS
//
//  Created by mac on 8/23/18.
//  Copyright © 2018 jilnesta. All rights reserved.
//

import UIKit

class Student_toppageViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Left", style: .plain, target: self, action: #selector(showLeftView(sender:)))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Right", style: .plain, target: self, action: nil)
    }
    //MARK: properties
    
    
    //MARK: private func
    
    //MARK: action tapped
    @IBAction func actionLesson_reservation(_ sender: AnyObject) {
        let vc = Lesson_reservationViewController.nib()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func actionStudent_lesson_history(_ sender: AnyObject) {
        
    }
    @IBAction func actionStudent_lesson_start(_ sender: AnyObject) {
        
    }
    @IBAction func actionStudent_lesson_finish(_ sender: AnyObject) {
        
    }
    @IBAction func actionInfo(_ sender: AnyObject) {
        
    }
    @IBAction func actionStudent_lesson_evaluation(_ sender: AnyObject) {
        
    }
    @objc private func showLeftView(sender: AnyObject?) {
        sideMenuController?.showLeftView(animated: true, completionHandler: nil)
    }


}
