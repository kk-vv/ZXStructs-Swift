//
//  UIDevice+ZX.swift
//  ZXStructs
//
//  Created by screson on 2017/4/1.
//  Copyright © 2017年 screson. All rights reserved.
//

import UIKit

enum ZX_DeviceSizeType {
    case s_4_0Inch,s_4_7Inch,s_5_5_Inch,s_iPad
    
    func description() -> String {
        switch self {
        case .s_4_0Inch:
            return "iPhone4/4s/5/5s/se"
        case .s_4_7Inch:
            return "iPhone6/6s/7"
        case .s_5_5_Inch:
            return "iPhone6P/6sP/7sP"
        case .s_iPad:
            return "iPad/New Device"
        }
    }
}

let ZX_IS_IPAD          = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad)
let ZX_IS_IPHONE        = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone)
let ZX_BOUNDS_WIDTH     = UIScreen.main.bounds.size.width
let ZX_BOUNDS_HEIGHT    = UIScreen.main.bounds.size.height

extension UIDevice {
    class func zx_DeviceSizeType() -> ZX_DeviceSizeType {
        if ZX_IS_IPHONE {
            let length = max(ZX_BOUNDS_WIDTH, ZX_BOUNDS_HEIGHT)
            if length <= 568.0 {
                return ZX_DeviceSizeType.s_4_0Inch
            }else if length <= 667 {
                return ZX_DeviceSizeType.s_4_7Inch
            }else {
                return ZX_DeviceSizeType.s_5_5_Inch
            }
        }else{
            return ZX_DeviceSizeType.s_iPad
        }
    }
}
