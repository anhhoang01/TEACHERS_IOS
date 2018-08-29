//
//  Inquiry_ViewController.swift
//  TEACHERS_IOS
//
//  Created by mac on 8/24/18.
//  Copyright © 2018 jilnesta. All rights reserved.
//

import UIKit

class Inquiry_ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    @IBOutlet weak var btnTypeQuestion: UIButton!
    @IBOutlet weak var tvDescription: UITextView!
    @IBOutlet weak var lblTypeQuestion: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBAction func actionTypeQuestion(_ sender: AnyObject){
        setupDropdown(dataSource: ["ログイン・会員登録について","レッスンの受講・開講について","各種設定方法について","お支払方法について","ご意見・ご要望","不具合・エラー関連","退会方法について","その他"], setLayout: btnTypeQuestion)
    }
    @IBAction func actionSendQuestion (_ sender: AnyObject) {
        if checkIsValid() {
            //send question to api
        }
    }
    //MARK: PRIVATE FUNCTION
    private func setupDropdown(dataSource: [String], setLayout button: UIButton) {
        let chooseDropDown = DropDown()
        chooseDropDown.anchorView = button
        chooseDropDown.bottomOffset = CGPoint(x: 0, y: button.bounds.height)
        chooseDropDown.dataSource = dataSource
        chooseDropDown.width = button.bounds.width
        chooseDropDown.selectionAction = { (index, item) in
            button.setTitle(item, for: .normal)
        }
        chooseDropDown.show()
    }
    private func checkIsValid() -> Bool{
        if btnTypeQuestion.titleLabel?.text == "選択してください" {
            lblTypeQuestion.text = "選択してください。"
            lblTypeQuestion.textColor = .red
            return false
        } else if tvDescription.text == "" {
            lblDescription.text = "入力してください。"
            lblDescription.textColor = .red
            return false
        }
        return true
    }
    private func setupUI(){
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Left", style: .plain, target: self, action: #selector(showLeftView(sender:)))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Right", style: .plain, target: self, action: nil)
    }
    @objc private func showLeftView(sender: AnyObject?) {
        sideMenuController?.showLeftView(animated: true, completionHandler: nil)
    }

}
