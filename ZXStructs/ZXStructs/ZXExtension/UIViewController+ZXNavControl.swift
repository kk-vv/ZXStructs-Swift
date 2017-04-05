//
//  UIViewController+ZXNavControl.swift
//  ZXStructs
//
//  Created by screson on 2017/4/5.
//  Copyright © 2017年 screson. All rights reserved.
//

import UIKit
let zx_navFixSapce:CGFloat = -10

enum ZXNavBarButtonItemPosition {
    case left,right
}

extension UIViewController {
    //MARK: - Navigation Control
    
    /// Clear backBarButtonItem Title
    func zx_clearNavbarBackButtonTitle() {
        let backItem = UIBarButtonItem(title: " ", style: .plain, target: self, action: #selector(self.zx_popviewController(animated:)))
        
        self.navigationItem.backBarButtonItem = backItem
    }
    
    func zx_navbarAddBarButtonItems(imageNames names:Array<String>,useOriginalColor:Bool, position:ZXNavBarButtonItemPosition) {
        if names.count > 0 {
            var items: Array<UIBarButtonItem> = Array()
            var n = 0
            for imgName in names {
                let negativeSpacer = UIBarButtonItem.init(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
                negativeSpacer.width = zx_navFixSapce
                items.append(negativeSpacer)
                
                var itemT:UIBarButtonItem!
                var image = UIImage.init(named: imgName)
                if useOriginalColor {
                    image = image?.withRenderingMode(.alwaysOriginal)
                }
                if position == .right {
                    itemT = UIBarButtonItem.init(image: image, style: .plain, target: self, action: #selector(self.xxx_rightBarButtonAction(sender:)))
                }else{
                    itemT = UIBarButtonItem.init(image: image, style: .plain, target: self, action: #selector(self.xxx_leftBarButtonAction(sender:)))
                }
                itemT.tag = n
                n += 1
                items.append(itemT)
            }
            if position == .left {
                self.navigationItem.leftBarButtonItems = items
            }else{
                self.navigationItem.rightBarButtonItems = items;
            }
        }else{
            if position == .left {
                self.navigationItem.leftBarButtonItem = nil
            }else{
                self.navigationItem.rightBarButtonItem = nil;
            }
        }
    }
    
    
    func zx_navbarAddBarButtonItems(textNames names:Array<String>,font:UIFont?,color:UIColor?, position:ZXNavBarButtonItemPosition) {
        if names.count > 0 {
            var items: Array<UIBarButtonItem> = Array()
            var n = 0
            for title in names {
                let negativeSpacer = UIBarButtonItem.init(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
                negativeSpacer.width = zx_navFixSapce
                items.append(negativeSpacer)
                
                var itemT:UIBarButtonItem!
                if position == .right {
                    itemT = UIBarButtonItem.init(title: title, style: .plain, target: self, action: #selector(self.xxx_rightBarButtonAction(sender:)))
                }else{
                    itemT = UIBarButtonItem.init(title: title, style: .plain, target: self, action: #selector(self.xxx_leftBarButtonAction(sender:)))
                }
                itemT.tag = n
                n += 1
                itemT.setTitleTextAttributes([NSFontAttributeName:font ?? ZXNavBarConfig.navTilteFont(ZXNavBarConfig.barButtonFontSize)!,NSForegroundColorAttributeName: color ?? UIColor.zx_navBarButtonColor!], for: .normal)
                items.append(itemT)
            }
            if position == .left {
                self.navigationItem.leftBarButtonItems = items
            }else{
                self.navigationItem.rightBarButtonItems = items;
            }
        }else{
            if position == .left {
                self.navigationItem.leftBarButtonItem = nil
            }else{
                self.navigationItem.rightBarButtonItem = nil;
            }
        }
    }
    
    func zx_navbarAddBarButtonItems(iconFontTexts names:Array<String>,fontSize size:CGFloat,color:UIColor?, position:ZXNavBarButtonItemPosition) {
        if names.count > 0 {
            var items: Array<UIBarButtonItem> = Array()
            var n = 0
            for title in names {
                let negativeSpacer = UIBarButtonItem.init(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
                negativeSpacer.width = zx_navFixSapce
                items.append(negativeSpacer)
                
                var itemT:UIBarButtonItem!
                if position == .right {
                    itemT = UIBarButtonItem.init(title: title, style: .plain, target: self, action: #selector(self.xxx_rightBarButtonAction(sender:)))
                }else{
                    itemT = UIBarButtonItem.init(title: title, style: .plain, target: self, action: #selector(self.xxx_leftBarButtonAction(sender:)))
                }
                itemT.setTitleTextAttributes([NSFontAttributeName: UIFont.zx_iconFont(size),NSForegroundColorAttributeName: color ?? UIColor.zx_navBarButtonColor!], for: .normal)
                itemT.tag = n
                n += 1
                items.append(itemT)
            }
            if position == .left {
                self.navigationItem.leftBarButtonItems = items
            }else{
                self.navigationItem.rightBarButtonItems = items;
            }
        }else{
            if position == .left {
                self.navigationItem.leftBarButtonItem = nil
            }else{
                self.navigationItem.rightBarButtonItem = nil;
            }
        }
    }
    
    
    func xxx_rightBarButtonAction(sender:UIBarButtonItem) {
        zx_rightBarButtonAction(index: sender.tag)
    }
    
    func zx_rightBarButtonAction(index: Int) {
        
    }
    
    func xxx_leftBarButtonAction(sender:UIBarButtonItem) {
        zx_leftBarButtonAction(index: sender.tag)
    }
    
    func zx_leftBarButtonAction(index: Int) {
        
    }
    
    func zx_popviewController(animated: Bool) {
        self.navigationController?.popViewController(animated: animated)
    }
}

