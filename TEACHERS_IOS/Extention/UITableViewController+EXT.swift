//
//  UITableViewController+EXT.swift
//  wimo-ios
//
//  Created by Unima M2001 on 12/19/17.
//  Copyright © 2017 Unima M2001. All rights reserved.
//

import Foundation
import UIKit

protocol NibLoadableViewH: class {
    static var nibNameH: String { get }
}

extension NibLoadableViewH where Self: UIView {
    static var nibNameH: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}

protocol ReusableView: class {
    static var defaultReuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return NSStringFromClass(self)
    }
}

extension UITableViewCell: NibLoadableViewH  {
    
}
extension UITableViewHeaderFooterView: ReusableView {
    
}




extension UITableView {
    
    func register<T: UITableViewCell>(_: T.Type) where  T: NibLoadableViewH {
    
    let nib = UINib(nibName: T.nibNameH, bundle: nil)
    
    register(nib, forCellReuseIdentifier: T.nibNameH)
    }
    
    
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T where T: NibLoadableViewH {
        guard let cell = dequeueReusableCell(withIdentifier: T.nibNameH, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.nibNameH)")
        }
        
        return cell
    }

}
