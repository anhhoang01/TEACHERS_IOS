//
//  Student_lesson_historyViewController.swift
//  TEACHERS_IOS
//
//  Created by mac on 9/6/18.
//  Copyright © 2018 jilnesta. All rights reserved.
//

import UIKit

class Student_lesson_historyViewController: BaseViewController   {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(Student_lesson_historyTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    

}
extension Student_lesson_historyViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as Student_lesson_historyTableViewCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
