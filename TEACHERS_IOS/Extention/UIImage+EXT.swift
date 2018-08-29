//
//  UIImage+EXT.swift
//  wimo-ios
//
//  Created by Unima M2001 on 12/27/17.
//  Copyright © 2017 Unima M2001. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    func compressTo(_ expectedSizeInMb:Int) -> (UIImage?, Data?) {
        let sizeInBytes = expectedSizeInMb * 512 * 1024
        var needCompress:Bool = true
        var imgData:Data?
        var compressingValue:CGFloat = 1.0
        while (needCompress && compressingValue > 0.0) {
            if let data:Data = UIImageJPEGRepresentation(self, compressingValue) {
                if data.count < sizeInBytes {
                    needCompress = false
                    imgData = data
                } else {
                    compressingValue -= 0.1
                }
            }
        }
        
        if let data = imgData {
            if (data.count < sizeInBytes) {
                print("data image count: \(data.count)")
                return (UIImage(data: data), data)
            }
        }
        return (nil, nil)
    }
    var uncompressedPNGData: Data!{ return UIImagePNGRepresentation(self)! }
    var highestQualityJPEGNSData: Data! { return UIImageJPEGRepresentation(self, 1.0)! }
    var highQualityJPEGNSData: Data! { return UIImageJPEGRepresentation(self, 0.75)! }
    var mediumQualityJPEGNSData: Data! { return UIImageJPEGRepresentation(self, 0.5)! }
    var lowQualityJPEGNSData: Data! { return UIImageJPEGRepresentation(self, 0.25)! }
    var lowestQualityJPEGNSData: Data! { return UIImageJPEGRepresentation(self, 0.15)! }
}
