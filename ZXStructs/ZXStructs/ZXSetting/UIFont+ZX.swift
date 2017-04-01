//
//  UIFont+ZX.swift
//  ZXStructs
//
//  Created by screson on 2017/4/1.
//  Copyright © 2017年 screson. All rights reserved.
//

import UIKit

extension UIFont {
    
    //MARK: - Font
    class var zx_titleFont: UIFont {
        return UIFont(name: ZXFontConfig.fontNameTitle, size: zx_fontSizeTitle)!
    }
    
    class var zx_subTitleFont: UIFont {
        return UIFont(name: ZXFontConfig.fontNameTitle, size: zx_fontSizeSubTitle)!
    }
    
    class var zx_bodyFont: UIFont {
        return UIFont(name: ZXFontConfig.fontNameBody, size: zx_fontSizeBody)!
    }
    
    class var zx_markFont: UIFont {
        return UIFont(name: ZXFontConfig.fontNameMark, size: zx_fontSizeMark)!
    }
    
    class var zx_iconFont: UIFont {
        return UIFont(name: ZXFontConfig.iconfontName, size: zx_fontSizeBody) ?? UIFont.systemFont(ofSize: zx_fontSizeBody)
    }
    
    //MARK: - Font-Name
    
    class var zx_fontNameTitle: String {
        return ZXFontConfig.fontNameTitle
    }
    
    class var zx_fontNameBody: String {
        return ZXFontConfig.fontNameBody
    }
    
    class var zx_fontNameMark: String {
        return ZXFontConfig.fontNameMark
    }
    
    class var zx_fontNameIconFont: String {
        return ZXFontConfig.iconfontName
    }
    
    //MARK: - Font-Size
    class var zx_fontSizeTitle: CGFloat {
        return ZXFontConfig.fontSizeTitle
    }
    
    class var zx_fontSizeSubTitle: CGFloat {
        return ZXFontConfig.fontSizeSubTitle
    }
    
    class var zx_fontSizeBody: CGFloat {
        return ZXFontConfig.fontSizeBody
    }
    
    class var zx_fontSizeMark: CGFloat {
        return ZXFontConfig.fontSizeMark
    }
}
