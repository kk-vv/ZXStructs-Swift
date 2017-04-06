//
//  UIColor+ZX.swift
//  ZXStructs
//
//  Created by JuanFelix on 2017/3/31.
//  Copyright © 2017年 screson. All rights reserved.
//

import Foundation
import UIKit

//MARK: - UIColor Extension
extension UIColor {
    
    //MARK: - Custom Color
    //MARK: - View-Color
    class var zx_tintColor: UIColor! {
        return zx_colorWithHexString(ZXTintColorConfig.tintColorStr)
    }
    
    class var zx_subTintColor: UIColor! {
        return zx_colorWithHexString(ZXTintColorConfig.subTintColorStr)
    }
    
    class var zx_backgroundColor: UIColor! {
        return zx_colorWithHexString(ZXTintColorConfig.backgrounColorStr)
    }
    
    class var zx_borderColor: UIColor! {
        return zx_colorWithHexString(ZXTintColorConfig.borderColorStr)
    }
    
    class var zx_empytColor: UIColor! {
        return zx_colorWithHexString(ZXTintColorConfig.emptyColorStr)
    }
    
    class var zx_customAColor: UIColor! {
        return zx_colorWithHexString(ZXTintColorConfig.customAColorStr)
    }
    
    class var zx_customBColor: UIColor! {
        return zx_colorWithHexString(ZXTintColorConfig.customBColorStr)
    }
    
    class var zx_customCColor: UIColor! {
        return zx_colorWithHexString(ZXTintColorConfig.customCColorStr)
    }
    //MARK: - Text-Color
    class var zx_textColorTitle: UIColor! {
        return zx_colorWithHexString(ZXFontConfig.textColorTitle)
    }
    
    class var zx_textColorBody: UIColor! {
        return zx_colorWithHexString(ZXFontConfig.textColorBody)
    }
    
    class var zx_textColorMark: UIColor! {
        return zx_colorWithHexString(ZXFontConfig.textColorMark)
    }
    
    //MARK: - NaviationBar-Color
    class var zx_navBarColor: UIColor! {
        return zx_colorWithHexString(ZXNavBarConfig.narBarColorStr)
    }
    
    class var zx_navBarTitleColor: UIColor! {
        return zx_colorWithHexString(ZXNavBarConfig.titleColorStr)
    }
    
    class var zx_navBarButtonColor: UIColor! {
        return zx_colorWithHexString(ZXNavBarConfig.barButtonColor)
    }
    
    //MARK: - Tabbar-Color
    class var zx_tabBarColor: UIColor! {
        return zx_colorWithHexString(ZXTabbarConfig.backgroundColorStr)
    }
    
    class var zx_tabBarTitleNormalColor: UIColor {
        return zx_colorWithHexString(ZXTabbarConfig.titleNormalColorStr)
    }
    
    class var zx_tabBarTitleSelectedColor: UIColor {
        return zx_colorWithHexString(ZXTabbarConfig.titleSelectedColorStr)
    }
    
    //MARK: - Color With HEX
    @discardableResult class func zx_colorWithHEX(_ hex:Int32) -> UIColor! {
        return zx_colorWithHex(hex, alpha: 1.0)
    }
    
    @discardableResult class func zx_colorWithHex(_ hex:Int32, alpha: CGFloat) -> UIColor! {
        return UIColor(red: ((CGFloat)((hex & 0xFF0000) >> 16)) / 255.0, green: ((CGFloat)((hex & 0xFF00) >> 8)) / 255.0, blue: ((CGFloat)(hex & 0xFF)) / 255.0, alpha: alpha)
    }
    
    @discardableResult class func zx_colorWithHexString(_ hexStr: String) -> UIColor {
        var cString: String = hexStr.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines).uppercased()
        if cString.hasPrefix("0x") || cString.hasPrefix("0X") {
            cString = cString.substring(from: 2)
        }
        if (cString.hasPrefix("#")) {
            cString = cString.substring(from: 1)
        }
        
        if (cString.characters.count != 6) {
            return UIColor.clear
        }
        let rString = cString.substring(to: 2)
        let gString = cString.substring(with: 2..<4)
        let bString = cString.substring(with: 4..<6)
        
        var r:UInt32 = 0, g:UInt32 = 0, b:UInt32 = 0;
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
    }
}
