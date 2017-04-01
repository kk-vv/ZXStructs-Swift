//
//  Bundle+ZX.swift
//  ZXStructs
//
//  Created by JuanFelix on 2017/3/31.
//  Copyright © 2017年 screson. All rights reserved.
//

import Foundation

//MARK: - Bunble Extension
extension Bundle{
    static var zxSettingBundle: Bundle {
        return Bundle.init(path: Bundle(for: ZXTintColorConfig.self).path(forResource: "ZXSettings", ofType: "bundle")!)!
    }
    
    class func zx_tintColorConfigPath() -> String! {
        return zxSettingBundle.path(forResource: "ZXConfig/ZXTintColorConfig", ofType: "plist")
    }
    
    class func zx_fontConfigPath() -> String! {
        return zxSettingBundle.path(forResource: "ZXConfig/ZXFontConfig", ofType: "plist")
    }
    
    class func zx_navBarConfigPath() -> String! {
        return zxSettingBundle.path(forResource: "ZXConfig/ZXNavBarConfig", ofType: "plist")
    }
    
    class func zx_tabBarConfigPath() -> String! {
        return zxSettingBundle.path(forResource: "ZXConfig/ZXTabBarConfig", ofType: "plist")
    }
}
