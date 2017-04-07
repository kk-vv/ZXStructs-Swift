//
//  ZXTabbarConfig.swift
//  ZXStructs
//
//  Created by JuanFelix on 2017/4/6.
//  Copyright © 2017年 screson. All rights reserved.
//

import UIKit


class ZXTabbarItem:NSObject {
    var embedInNavigation:  Bool    = true
    var showAsPresent:      Bool    = false
    var normalImage:        String  = ""
    var selectedImage:      String  = ""
    var title:              String  = ""
    
    override init() {
        
    }
    
    init(_ dic:[String:Any]!) {
        super.init()
        self.setValuesForKeys(dic)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}

class ZXTabbarConfig: NSObject {
    static var config: NSDictionary?
    class func zxTarbarConfig() -> NSDictionary!{
        guard let cfg = config else {
            config = NSDictionary.init(contentsOfFile: Bundle.zx_tabBarConfigPath())!
            return config
        }
        return cfg
    }
    
    class var showSeparatorLine: Bool {
        return configBoolValue(forKey: "zx_showSeparatorLine", defaultValue: true)
    }
    
    class var isTranslucent: Bool {
        return configBoolValue(forKey: "zx_isTranslucent", defaultValue: false)
    }
    
    class var isCustomTitleFont: Bool {
        return configBoolValue(forKey: "zx_customTitleFont", defaultValue: false)
    }
    
    class var customTitleFont: UIFont {
        return UIFont(name: customTitleFontName, size: customTitleFontSize)!
    }
    
    class var customTitleFontSize: CGFloat {
        return configFontSizeValue(forKey: "zx_customTitleFontSize", defaultSize: 11)
    }
    
    class var customTitleFontName: String {
        return configStringValue(forKey: "zx_customTitleFontName", defaultValue: "Arial")
    }
    
    class var backgroundColorStr: String {
        return configStringValue(forKey: "zx_backgroundColor", defaultValue: "#ff0000")
    }
    
    class var titleNormalColorStr: String {
        return configStringValue(forKey: "zx_titleNormalColor", defaultValue: "#ff0000")
    }
    
    class var titleSelectedColorStr: String {
        return configStringValue(forKey: "zx_titleSelectedColor", defaultValue: "#ff0000")
    }
    
    class var barItems: [ZXTabbarItem] {
        var arrItems: [ZXTabbarItem] = []
        if let items = zxTarbarConfig().object(forKey: "zx_barItems") as? Array<Dictionary<String,Any>> {
            for item in items {
                arrItems.append(ZXTabbarItem(item))
            }
        }
        return arrItems
    }

}

extension ZXTabbarConfig: ZXConfigValueProtocol{
    static func configStringValue(forKey key: String!, defaultValue: String!) -> String! {
        if let configStr = (zxTarbarConfig().object(forKey: key) as? String),configStr.characters.count > 0 {
            return configStr
        }
        return defaultValue
    }
    
    static func configFontSizeValue(forKey key:String,defaultSize:CGFloat) -> CGFloat {
        if let dicF = zxTarbarConfig().object(forKey: key) as? NSDictionary {
            switch UIDevice.zx_DeviceSizeType() {
            case .s_4_0Inch:
                return dicF.object(forKey: "4_0") as! CGFloat
            case .s_4_7Inch:
                return dicF.object(forKey: "4_7") as! CGFloat
            case .s_5_5_Inch:
                return dicF.object(forKey: "5_5") as! CGFloat
            default:
                return dicF.object(forKey: "5_5") as! CGFloat
            }
        }
        return defaultSize
    }
    
    static func configBoolValue(forKey key:String, defaultValue: Bool) -> Bool {
        if let boolValue = zxTarbarConfig().object(forKey: key) as? Bool {
            return boolValue
        }
        return defaultValue
    }
    
    static func active() {
        let tabBarAppearance = UITabBar.appearance()
        tabBarAppearance.isTranslucent  = ZXTabbarConfig.isTranslucent
        tabBarAppearance.barTintColor   = UIColor.zx_tabBarColor
        if !ZXTabbarConfig.showSeparatorLine {
            tabBarAppearance.shadowImage = UIImage()
            tabBarAppearance.backgroundImage = UIImage()
        }
        
        let tabBarItem = UITabBarItem.appearance()
        if !ZXTabbarConfig.isCustomTitleFont {
            tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.zx_tabBarTitleNormalColor], for: .normal)
            tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.zx_tabBarTitleSelectedColor], for: .selected)
        }else{
            tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.zx_tabBarTitleNormalColor,NSFontAttributeName:ZXTabbarConfig.customTitleFont], for: .normal)
            tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.zx_tabBarTitleSelectedColor,NSFontAttributeName:ZXTabbarConfig.customTitleFont], for: .selected)
        }
    }
}
