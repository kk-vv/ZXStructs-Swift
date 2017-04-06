//
//  ZXTintColorConfig.swift
//  ZXStructs
//
//  Created by JuanFelix on 2017/3/31.
//  Copyright © 2017年 screson. All rights reserved.
//

import UIKit


class ZXTintColorConfig: NSObject {
    //MARK: - Config Dic
    static var config: NSDictionary?
    class func zxTintColorConfig() -> NSDictionary!{
        guard let cfg = config else {
            config = NSDictionary.init(contentsOfFile: Bundle.zx_tintColorConfigPath())!
            return config
        }
        return cfg
    }
    
    //MARK: - Color Hex String
    //[#ff0000]: Red Color means config failed!
    class var tintColorStr: String! {
        return configStringValue(forKey:"zx_tintColor", defaultValue: "#ff0000")
    }
    
    class var subTintColorStr: String! {
        return configStringValue(forKey:"zx_subTintColor", defaultValue: "#ff0000")
    }

    class var backgrounColorStr: String! {
        return configStringValue(forKey:"zx_backgroundColor", defaultValue: "#ff0000")
    }
    
    class var borderColorStr: String! {
        return configStringValue(forKey:"zx_borderColor", defaultValue: "#ff0000")
    }
    
    class var emptyColorStr: String! {
        return configStringValue(forKey:"zx_emptyColor", defaultValue: "#ffffff")
    }
    
    class var customAColorStr: String! {
        return configStringValue(forKey:"zx_customAColor", defaultValue: "#ff0000")
    }
    
    class var customBColorStr: String! {
        return configStringValue(forKey:"zx_customBColor", defaultValue: "#ff0000")
    }
    
    class var customCColorStr: String! {
        return configStringValue(forKey:"zx_customCColor", defaultValue: "#ff0000")
    }
}

//MARK: Config Value
extension ZXTintColorConfig: ZXConfigValueProtocol {
    static func configStringValue(forKey key: String!, defaultValue: String!) -> String! {
        if let colorStr = (zxTintColorConfig().object(forKey: key) as? String), colorStr.characters.count > 0 {
            return colorStr
        }
        return defaultValue
    }
}
