//
//  Lesson_reservationTableViewCell.swift
//  TEACHERS_IOS
//
//  Created by mac on 8/28/18.
//  Copyright © 2018 jilnesta. All rights reserved.
//

import UIKit
import MGSwipeTableCell
import Cosmos
class Lesson_reservationTableViewCell: MGSwipeTableCell {

    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var lblFullname: UILabel!
    @IBOutlet weak var lblLanguageLevel: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var lblSex: UILabel!
    @IBOutlet weak var lblScore: UILabel!
    @IBOutlet weak var lblCountReport: UILabel!
    @IBOutlet weak var lblRPTeacher: UILabel!
    @IBOutlet weak var ratingView: CosmosView!
    override func layoutSubviews() {
        super.layoutSubviews()
        self._setupUI()
    }
    var ratingPoin: Double = 0 {
        didSet {
            ratingView.rating = ratingPoin
        }
    }
    private func _setupUI(){
        
        imgAvatar.layer.cornerRadius = imgAvatar.frame.width/2
        imgAvatar.layer.borderWidth = 1
        let myColor : UIColor = UIColor.clear
        imgAvatar.layer.borderColor = myColor.cgColor
    }
}
