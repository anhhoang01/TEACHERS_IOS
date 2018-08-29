//
//  Teacher_Register_CMNDViewController.swift
//  TEACHERS_IOS
//
//  Created by mac on 8/21/18.
//  Copyright © 2018 jilnesta. All rights reserved.
//

import UIKit

class Register_CardIDViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addGesture()
        
        // Do any additional setup after loading the view.
    }
    //MARK: - Outlet ..
    @IBOutlet weak var btnTypeIDCard: UIButton!
    @IBOutlet weak var imgIDCardfront: UIImageView!
    @IBOutlet weak var imgIDCardbehind: UIImageView!

    //MARK: Properties
    private var imagePicker = UIImagePickerController()
    private var imagePicked = 0
    var user = [String:String]()
    //MARK: - Action tapped
    @IBAction func actionTypeIDCard(_ sender: AnyObject) {
        self.setupDropdown(dataSource: ["N1", "N2", "N3"], setLayout: btnTypeIDCard)
    }
    @IBAction func actionBackTop(_ sender: AnyObject) {
        let vc = Register_BackTopViewController.nib()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    //MARK: - Handle Tapped
    @objc func handleTap(_ sender: UIGestureRecognizer) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { _ in
            self.openCamera()
        }))
        
        alert.addAction(UIAlertAction(title: "Choose Photo", style: .default, handler: { _ in
            self.openGallary()
        }))
        
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        
        //If you want work actionsheet on ipad then you have to use popoverPresentationController to present the actionsheet, otherwise app will crash in iPad
        switch UIDevice.current.userInterfaceIdiom {
        case .pad: break
//            alert.popoverPresentationController?.sourceView = sender
//            alert.popoverPresentationController?.sourceRect = sender.bounds
//            alert.popoverPresentationController?.permittedArrowDirections = .up
        default:
            break
        }
        imagePicked = 0
        self.present(alert, animated: true, completion: nil)
    }
    @objc func handleTapBehind(_ sender: UIGestureRecognizer) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { _ in
            self.openCamera()
        }))
        
        alert.addAction(UIAlertAction(title: "Choose Photo", style: .default, handler: { _ in
            self.openGallary()
        }))
        
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        
        //If you want work actionsheet on ipad then you have to use popoverPresentationController to present the actionsheet, otherwise app will crash in iPad
        switch UIDevice.current.userInterfaceIdiom {
        case .pad: break
//        alert.popoverPresentationController?.sourceView = sender
//        alert.popoverPresentationController?.sourceRect = sender.bounds
//        alert.popoverPresentationController?.permittedArrowDirections = .up
        default:
            break
        }
        imagePicked = 1
        self.present(alert, animated: true, completion: nil)
    }
    //MARK: - Add Gesture to imageView
    private func addGesture(){
        let tapGestureRecognizerIDCardfront = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        imgIDCardfront.isUserInteractionEnabled = true
        imgIDCardfront.addGestureRecognizer(tapGestureRecognizerIDCardfront)
        
        let tapGestureRecognizerIDCardbehind = UITapGestureRecognizer(target: self, action: #selector(handleTapBehind(_:)))
        imgIDCardbehind.isUserInteractionEnabled = true
        imgIDCardbehind.addGestureRecognizer(tapGestureRecognizerIDCardbehind)
    }
    //MARK: - Open the camera
    private func openCamera(){
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)){
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            //If you dont want to edit the photo then you can set allowsEditing to false
            imagePicker.allowsEditing = true
            imagePicker.delegate = self
            self.present(imagePicker, animated: true, completion: nil)
        }
        else{
            let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    //MARK: - Choose image from camera roll
    private func openGallary(){
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        //If you dont want to edit the photo then you can set allowsEditing to false
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        self.present(imagePicker, animated: true, completion: nil)
    }
    //MARK: -Setup dropdown
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
    
}

//MARK: - UIImagePickerControllerDelegate
extension Register_CardIDViewController:  UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        /*
         Get the image from the info dictionary.
         If no need to edit the photo, use `UIImagePickerControllerOriginalImage`
         instead of `UIImagePickerControllerEditedImage`
         */
        if let editedImage = info[UIImagePickerControllerEditedImage] as? UIImage{
            //self.imgIDCardfront.image = editedImage
            if imagePicked == 0 {
                self.imgIDCardfront.image = editedImage
            }else{
                self.imgIDCardbehind.image = editedImage
            }
        }
        
        //Dismiss the UIImagePicker after selection
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
        print("Cancelled")
    }
    
}
