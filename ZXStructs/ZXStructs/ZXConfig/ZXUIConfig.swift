//
//  ZXUIConfig.swift
//  ZXStructs
//
//  Created by screson on 2017/4/1.
//  Copyright © 2017年 screson. All rights reserved.
//

import UIKit

class ZXUIConfig: NSObject {
    class func loadnavBarConfig() {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.isTranslucent  = ZXNavBarConfig.isTranslucent
        navBarAppearance.barTintColor   = UIColor.zx_navBarColor
        navBarAppearance.tintColor      = UIColor.zx_navBarButtonColor
        
        navBarAppearance.titleTextAttributes = {[NSForegroundColorAttributeName: UIColor.zx_navBarTitleColor,NSFontAttributeName: ZXNavBarConfig.navTilteFont(ZXNavBarConfig.titleFontSize)]}()

        if !ZXNavBarConfig.showSeparatorLine {
            navBarAppearance.shadowImage = UIImage()
            navBarAppearance.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        }
        
        if !ZXNavBarConfig.userSystemBackButton {
            navBarAppearance.backIndicatorImage = Bundle.zx_navBackImage()
            navBarAppearance.backIndicatorTransitionMaskImage = Bundle.zx_navBackImage()
        }
    }
    
    class func loadtabBarConfig() {
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
