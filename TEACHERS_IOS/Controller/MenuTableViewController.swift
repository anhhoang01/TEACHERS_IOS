//
//  MenuTableViewController.swift
//  TEACHERS_IOS
//
//  Created by mac on 8/24/18.
//  Copyright © 2018 jilnesta. All rights reserved.
//

import UIKit


class MenuTableViewController: BaseViewController , UITableViewDelegate, UITableViewDataSource{

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setupUI()
    }
    //MARK: OUTLET
    @IBOutlet weak var tableView: UITableView!
    //MARK: PROPERTIES
    private var isStudentList: Bool = false
    private var arrTitleMenu : [String] = []
    private func setupStudentList() {
        arrTitleMenu.removeAll()
        if isStudentList {
            let arrStudent = ["1","2","3","4","5","6"]
            for i in arrStudent {
                arrTitleMenu.append(i)
            }
        }else {
            let arrTeachers = ["7","8","9","10","11","12"]
            for i in arrTeachers {
                arrTitleMenu.append(i)
            }
        }
    }
    //PRIVATE FUNCTION
    private func setupUI(){
        tableView.register(MenuTableTableViewCell.self)
        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsets(top: 44.0, left: 0.0, bottom: 44.0, right: 0.0)
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .clear
        self.navigationController?.isNavigationBarHidden = true
        setupStudentList()
    }
    
    //MARK: tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrTitleMenu.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as MenuTableTableViewCell
        if isStudentList {
            cell.menuCell!.text = arrTitleMenu[indexPath.row]
        }else {
            cell.menuCell!.text = arrTitleMenu[indexPath.row]
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    private func pushToVC(viewController:BaseViewController) {
        let mainViewController = sideMenuController!
        let navigationController = mainViewController.rootViewController as! BaseNavigationController
        navigationController.pushViewController(viewController, animated: true)
        mainViewController.hideLeftView(animated: true, completionHandler: nil)
    }
    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isStudentList {
            
        }else {
            switch indexPath.row{
            case 0:
                let vc = Student_toppageViewController.nib()
                self.pushToVC(viewController: vc)
            case 1:
                let vc = Student_profile_editViewController.nib()
                self.pushToVC(viewController: vc)
            case 2:
                let vc = Student_SettingViewController.nib()
                self.pushToVC(viewController: vc)
            case 3:
                let vc = Inquiry_ViewController.nib()
                self.pushToVC(viewController: vc)
            case 4:
                let vc = Terms_of_serviceViewController.nib()
                self.pushToVC(viewController: vc)
            case 5:
                let alert = UIAlertController(title: "TEACHERS", message: "LOGOUT", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "NO", style: .cancel))
                alert.addAction(UIAlertAction(title: "YES", style: .default, handler: {action in
                    //call api logout
                    let viewcontroller = LoginViewController.nib()
                    let navigation = BaseNavigationController(rootViewController: viewcontroller)
                    if let window = UIApplication.shared.keyWindow {
                        window.rootViewController = navigation
                        kUserDefault.set(false, forKey: kuser)
                    }
                }))
                self.present(alert, animated: true, completion: nil)
                
            default:
                break
            }
        }
    }
    
}
