//
//  Lesson_reservationViewController.swift
//  TEACHERS_IOS
//
//  Created by mac on 8/24/18.
//  Copyright © 2018 jilnesta. All rights reserved.
//

import UIKit
import GooglePlaces
import MGSwipeTableCell
class MailData {
    var avatar: String!
    var name: String!
    var level: String!
    var age: String!
    var sex: String!
    var poin: Double!
    var pr: String!
}
typealias MailActionCallback = (_ cancelled: Bool, _ deleted: Bool, _ actionIndex: Int) -> Void
class Lesson_reservationViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: OUTLET
    @IBOutlet weak var heightViewSearch: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblDatePicker: UILabel!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var lblSearchAddress: UILabel!
    @IBOutlet weak var tfSearchPR: UITextField!
    private var datePicked = Date()
    private var demoData = [MailData]()
    private var refreshControl: UIRefreshControl!
    private var actionCallback: MailActionCallback?
    private var isHidenView = true
    //MARK: ACTION TAPPED
    @IBAction func actionShow7Date(_ sender: AnyObject) {
        datePickerTapped(animated: true, completion: { [weak self] date in
            let formater = DateFormatter()
            formater.dateFormat = TimeFormat.MONTH_DATE_YEAR_FORMAT
            self?.lblDatePicker.text = formater.string(from: (self?.datePicked)!)
        })
    }
    @IBAction func actionSearch(_ sender: AnyObject) {
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = self
        present(autocompleteController, animated: true, completion: nil)
    }
    //MARK: PRIVATE FUNCTION
    private func prepareDemoData() {
        var avatar = [
            "avatar",
            "avatar",
            "avatar",
            "avatar",
            "avatar",
            "avatar",
            "avatar",
            "avatar",
            "avatar",
            "avatar",
            "avatar"
        ];
        
        var name = [
            "You think water",
            "They called ",
            "The path of the ",
            "Do you see any Teletubbies in here?",
            "Now that we know who you are",
            "My money's in that office, right?",
            "Now we took an oath",
            "That show's called a pilot",
            "I know who I am. I'm not a mistake",
            "It all makes sense!",
            "The selfish and the tyranny of evil men",
            ];
        
        var level = [
            "N1",
            "N2",
            "N1",
            "N3",
            "N5",
            "N3",
            "N4",
            "N5",
            "N1",
            "N3",
            "N3",
            ];
        var age = [
            "23",
            "23",
            "21",
            "24",
            "53",
            "23",
            "19",
            "23",
            "53",
            "56",
            "78",
            ];
        var sex = [
            "male",
            "female",
            "male",
            "male",
            "female",
            "male",
            "female",
            "male",
            "female",
            "male",
            "female",
            ];
        var poin = [
            1,
            3,
            3,5,
            5,
            3,
            1,
            2,
            3.7,
            4.3,
            2.5,
            4.1,
            ];
        var pr = [
            "You should see ice. It moves like it has a mind. Like it knows it killed the world once and got a taste for murder. After the avalanche, it took us a week to climb out.",
            "And I will strike down upon thee with great vengeance and furious anger those who would attempt to poison and destroy My brothers.",
            "Look, just because I don't be givin' no man a foot massage don't make it right for Marsellus to throw Antwone into a glass motherfuckin' house",
            "No? Well, that's what you see at a toy store. And you must think you're in a toy store, because you're here shopping for an infant named Jeb.Blessed is he who, in the name of charity and good will, shepherds the weak through the valley of darkness, for he is truly his brother's keeper and the finder of lost childrenBlessed is he who, in the name of charity and good will, shepherds the weak through the valley of darkness, for he is truly his brother's keeper and the finder of lost childrenBlessed is he who, in the name of charity and good will, shepherds the weak through the valley of darkness, for he is truly his brother's keeper and the finder of lost children",
            "In a comic, you know how you can tell who the arch-villain's going to be? He's the exact opposite of the hero",
            "If she start giving me some bullshit about it ain't there, and we got to go someplace else and get it, I'm gonna shoot you in the head then and there.",
            "that I'm breaking now. We said we'd say it was the snow that killed the other two, but it wasn't. Nature is lethal but it doesn't hold a candle to man.",
            "Then they show that show to the people who make shows, and on the strength of that one show they decide if they're going to make more shows.Blessed is he who, in the name of charity and good will, shepherds the weak through the valley of darkness, for he is truly his brother's keeper and the finder of lost children",
            "And most times they're friends, like you and me! I should've known way back when...",
            "After the avalanche, it took us a week to climb out. Now, I don't know exactly when we turned on each other, but I know that seven of us survived the slide",
            "Blessed is he who, in the name of charity and good will, shepherds the weak through the valley of darkness, for he is truly his brother's keeper and the finder of lost childrenBlessed is he who, in the name of charity and good will, shepherds the weak through the valley of darkness, for he is truly his brother's keeper and the finder of lost childrenBlessed is he who, in the name of charity and good will, shepherds the weak through the valley of darkness, for he is truly his brother's keeper and the finder of lost children",
            ];
        
        
        for i in 0 ..< name.count {
            let mail = MailData()
            mail.avatar = avatar[i]
            mail.name = name[i]
            mail.level = level[i]
            mail.age = age[i]
            mail.sex = sex[i]
            mail.poin = poin[i]
            mail.pr = pr[i]
            demoData.append(mail);
        }
    }
    private func setupUI(){
        heightViewSearch.constant = 0
        tableView.register(Lesson_reservationTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Right", style: .plain, target: self, action: #selector(actionShowSearch(_:)))
        refreshControl = UIRefreshControl();
        refreshControl.addTarget(self, action: #selector(refreshCallback), for: UIControlEvents.valueChanged);
        tableView.addSubview(refreshControl);
        prepareDemoData();
    }
    //MARK: SETUP DATEPICKER
    private func datePickerTapped(animated flag: Bool, completion: @escaping (_ date: Date) -> Void) {
        let minDate = Date(dateString: "12/27/1900")
        var dateComponents = DateComponents()
        dateComponents.day = +7
        let sevenDayNext = Calendar.current.date(byAdding: dateComponents, to: minDate)
        let datePicker = DatePickerDialog(textColor: .red,
                                          buttonColor: .red,
                                          font: UIFont.boldSystemFont(ofSize: 17),
                                          showCancelButton: true)
        datePicker.show("DatePickerDialog",
                        doneButtonTitle: "Done",
                        cancelButtonTitle: "Cancel",
                        minimumDate: minDate,
                        maximumDate: sevenDayNext,
                        datePickerMode: .date) { (date) in
                            if let dt = date {
                                self.datePicked  = dt
                                completion(dt)
                            }
        }
    }
    @objc private func actionShowSearch(_ sender: UIButton) {
        
        if isHidenView == true {
            heightViewSearch.constant = 300
            isHidenView = false
        }else{
            heightViewSearch.constant = 0
            isHidenView = true
        }
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
        tfSearchPR.resignFirstResponder()
    }
    
}
extension Lesson_reservationViewController : UITableViewDataSource , UITableViewDelegate, UIActionSheetDelegate, MGSwipeTableCellDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return demoData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as Lesson_reservationTableViewCell
        cell.delegate = self;
        let data: MailData = demoData[(indexPath as NSIndexPath).row];
        cell.imgAvatar.image = UIImage(named: data.avatar)
        cell.lblFullname.text = data.name
        cell.lblAge.text = data.age
        cell.lblSex.text = data.sex
        cell.lblLanguageLevel.text = data.level
        cell.lblScore.text = String(data.poin)
        cell.lblRPTeacher.text = data.pr
        cell.ratingView.rating = data.poin
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func mailForIndexPath(_ path: IndexPath) -> MailData {
        return demoData[(path as NSIndexPath).row]
    }
    @objc
    func refreshCallback() {
        prepareDemoData()
        tableView.reloadData()
        refreshControl.endRefreshing()
    }
    
//    func deleteMail(_ path:IndexPath) {
//        demoData.remove(at: (path as NSIndexPath).row)
//        tableView.deleteRows(at: [path], with: .left)
//    }
    
    func showMailActions(_ mail: MailData, callback: @escaping MailActionCallback) {
        actionCallback = callback
        let sheet = UIActionSheet.init(title: "Actions", delegate: self, cancelButtonTitle: "Cancel", destructiveButtonTitle: "Flag")
        
        //sheet.addButton(withTitle: "Mark as unread")
        //sheet.addButton(withTitle: "Mark as read")
        //sheet.addButton(withTitle: "Flag")
        
        sheet.show(in: self.view);
    }
    
    func actionSheet(_ actionSheet: UIActionSheet, clickedButtonAt index: Int) {
        if let action = actionCallback {
            action(index == actionSheet.cancelButtonIndex,
                   index == actionSheet.destructiveButtonIndex,
                   index);
            actionCallback = nil
        }
    }
    
    func readButtonText(_ read:Bool) -> String {
        return read ? "Mark as\nunread" : "Mark as\nread"
    }
    func swipeTableCell(_ cell: MGSwipeTableCell, canSwipe direction: MGSwipeDirection) -> Bool {
        return true
    }
    func swipeTableCell(_ cell: MGSwipeTableCell, swipeButtonsFor direction: MGSwipeDirection, swipeSettings: MGSwipeSettings, expansionSettings: MGSwipeExpansionSettings) -> [UIView]? {
        
        swipeSettings.transition = MGSwipeTransition.border
        expansionSettings.buttonIndex = 0
        
        
//        let mail = mailForIndexPath(tableView.indexPath(for: cell)!)
        
        if direction == MGSwipeDirection.leftToRight {
//            expansionSettings.fillOnTrigger = false
//            expansionSettings.threshold = 2
//            let color = UIColor.init(red:0.0, green:122/255.0, blue:1.0, alpha:1.0)
//
//            return [
//                MGSwipeButton(title: readButtonText(mail.read), backgroundColor: color, callback: { (cell) -> Bool in
//                    mail.read = !mail.read
//                    cell.refreshContentView()
//                    (cell.leftButtons[0] as! UIButton).setTitle(self.readButtonText(mail.read), for: UIControlState())
//
//                    return true
//                })
//            ]
            return nil
        }
        else {
            expansionSettings.fillOnTrigger = true
            expansionSettings.threshold = 1.1
            let padding = 15
            
//            let trash = MGSwipeButton(title: "Trash", backgroundColor: color1, padding: padding, callback: { (cell) -> Bool in
//                self.deleteMail(self.tableView.indexPath(for: cell)!)
//                return false; //don't autohide to improve delete animation
//            })
            
            let flag = MGSwipeButton(title: "Flag", backgroundColor: kBlueColor, padding: padding, callback: { (cell) -> Bool in
                let mail = self.mailForIndexPath(self.tableView.indexPath(for: cell)!)
                print("--> mail",mail)
                //push to 16-2.Lesson_reservation_by_calender
                cell.refreshContentView() //needed to refresh cell contents while swipping
                return true //autohide
            });
            
//            let more = MGSwipeButton(title: "More", backgroundColor: color3, padding: padding, callback: { (cell) -> Bool in
//                let path = self.tableView.indexPath(for: cell)!
//                let mail = self.mailForIndexPath(path)
//
//                self.showMailActions(mail, callback: { (cancelled, deleted, index) in
//                    if cancelled {
//                        return
//                    }
//                    else if deleted {
//                        self.deleteMail(path)
//                    }
//                    else if index == 1 {
//                        mail.read = !mail.read
//                        cell.refreshContentView()
//                        (cell.leftButtons[0] as! UIButton).setTitle(self.readButtonText(mail.read), for: UIControlState())
//                        cell.hideSwipe(animated: true);
//                    }
//                    else if index == 2 {
//                        mail.flag = !mail.flag;
//                        cell.refreshContentView(); //needed to refresh cell contents while swipping
//                        cell.hideSwipe(animated: true);
//                    }
//
//                });
//
//                return false; // Don't autohide
//            });
            //return [trash, flag, more];
            return [flag]
        }
        
    }
    
   
}
//MARK: EXTENTION GMSAutocompleteViewControllerDelegate
extension Lesson_reservationViewController: GMSAutocompleteViewControllerDelegate {
    
    // Handle the user's selection.
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        print("Place name: \(place.name)")
        print("Place address: \(String(describing: place.formattedAddress))")
        print("Place attributions: \(String(describing: place.attributions))")
        lblSearchAddress.text = place.formattedAddress
        //call api search teachers in place
        dismiss(animated: true, completion: nil)
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        // TODO: handle the error.
        print("Error: ", error.localizedDescription)
    }
    
    // User canceled the operation.
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    // Turn the network activity indicator on and off again.
    func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
}
