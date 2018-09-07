//
//  InfoViewController.swift
//  TEACHERS_IOS
//
//  Created by mac on 9/7/18.
//  Copyright © 2018 jilnesta. All rights reserved.
//

import UIKit

class InfoViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(InfoTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
    }

    @IBOutlet weak var tableView: UITableView!
}
extension InfoViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        return cell
    }
}
