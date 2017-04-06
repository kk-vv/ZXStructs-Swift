//
//  UIFont+ZX.swift
//  ZXStructs
//
//  Created by JuanFelix on 2017/4/1.
//  Copyright © 2017年 screson. All rights reserved.
//

import UIKit

extension UIFont {
    
    //MARK: - Font
    class var zx_titleFont: UIFont {
        return UIFont(name: ZXFontConfig.fontNameTitle, size: zx_titleFontSize)!
    }
    
    class var zx_subTitleFont: UIFont {
        return UIFont(name: ZXFontConfig.fontNameTitle, size: zx_subTitleFontSize)!
    }
    
    class var zx_bodyFont: UIFont {
        return UIFont(name: ZXFontConfig.fontNameBody, size: zx_bodyFontSize)!
    }
    
    class var zx_markFont: UIFont {
        return UIFont(name: ZXFontConfig.fontNameMark, size: zx_markFontSize)!
    }
    
    class var zx_iconFont: UIFont {
        return UIFont(name: ZXFontConfig.iconfontName, size: zx_bodyFontSize) ?? UIFont.systemFont(ofSize: zx_bodyFontSize)
    }
    
    //MARK: - Font-Name
    
    class var zx_titleFontNameTitle: String {
        return ZXFontConfig.fontNameTitle
    }
    
    class var zx_bodyFontName: String {
        return ZXFontConfig.fontNameBody
    }
    
    class var zx_markFontName: String {
        return ZXFontConfig.fontNameMark
    }
    
    class var zx_iconFontName: String {
        return ZXFontConfig.iconfontName
    }
    
    //MARK: - Font-Size
    class var zx_titleFontSize: CGFloat {
        return ZXFontConfig.fontSizeTitle
    }
    
    class var zx_subTitleFontSize: CGFloat {
        return ZXFontConfig.fontSizeSubTitle
    }
    
    class var zx_bodyFontSize: CGFloat {
        return ZXFontConfig.fontSizeBody
    }
    
    class var zx_markFontSize: CGFloat {
        return ZXFontConfig.fontSizeMark
    }
    
    //MARK: - Func 
    class func zx_titleFont(_ size:CGFloat) -> UIFont {
        return UIFont(name: ZXFontConfig.fontNameTitle, size: size)!
    }
    
    class func zx_subTitleFont(_ size:CGFloat) -> UIFont {
        return UIFont(name: ZXFontConfig.fontNameTitle, size: size)!
    }
    
    class func zx_bodyFont(_ size:CGFloat) -> UIFont {
        return UIFont(name: ZXFontConfig.fontNameBody, size: size)!
    }
    
    class func zx_markFont(_ size:CGFloat) -> UIFont {
        return UIFont(name: ZXFontConfig.fontNameMark, size: size)!
    }
    
    class func zx_iconFont(_ size:CGFloat) -> UIFont {
        return UIFont(name: ZXFontConfig.iconfontName, size: size) ?? UIFont.systemFont(ofSize: size)
    }

}
