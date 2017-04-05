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
            navBarAppearance.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
            navBarAppearance.shadowImage = UIImage()
        }
        
        if !ZXNavBarConfig.userSystemBackButton {
            navBarAppearance.backIndicatorImage = Bundle.zx_navBackImage()
            navBarAppearance.backIndicatorTransitionMaskImage = Bundle.zx_navBackImage()
        }
    }
}
