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
        navBarAppearance.barTintColor   = UIColor.zx_navBarColor
        navBarAppearance.isTranslucent  = ZXNavBarConfig.isTranslucent
        navBarAppearance.tintColor      = UIColor.zx_navBarButtonColor
        
        navBarAppearance.titleTextAttributes = {[NSForegroundColorAttributeName: UIColor.zx_navBarTitleColor,NSFontAttributeName: ZXNavBarConfig.navTilteFont]}()

        if !ZXNavBarConfig.showSeparatorLine {
            navBarAppearance.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
            navBarAppearance.shadowImage = UIImage()
        }
        
//        + (UIImage *)zx_navBackImage{
//            static UIImage * navBackImage = nil;
//            if (!navBackImage) {
//                navBackImage = [UIImage imageWithContentsOfFile:[[self zx_settingBundle] pathForResource:@"zx_navback" @ scale ofType:@"png"]];
//            }
//            return navBackImage;
//        }
    }
}
