//
//  UITabbarController+ZX.swift
//  ZXStructs
//
//  Created by JuanFelix on 2017/4/6.
//  Copyright © 2017年 screson. All rights reserved.
//

import UIKit
class ZXPresentVCInfo: NSObject {
    static var zxPresentVCsDic:Dictionary<String,ZXPresentVCInfo> = [:]
    var className: String! = NSStringFromClass(UIViewController.self)
    var barItem: ZXTabbarItem! = nil
}

extension UITabBarController {
    
    final func zx_addChildViewController(_ controller:UIViewController!,fromItem item:ZXTabbarItem) {
        var normalImage = UIImage.init(named: item.normalImage)
        normalImage     = normalImage?.withRenderingMode(.alwaysOriginal)
        
        var selectedImage   = UIImage.init(named: item.selectedImage)
        selectedImage       = selectedImage?.withRenderingMode(.alwaysOriginal)
        
        controller.tabBarItem.image = normalImage
        controller.tabBarItem.selectedImage = selectedImage
        controller.tabBarItem.title = item.title
        
        
        if item.showAsPresent {
//            let mInfo = ZXPresentVCInfo.init(["className":String(describing: type(of: controller)),"barItem":item])
            let mInfo = ZXPresentVCInfo.init()
            //mInfo.className = String(describing: type(of: controller))
//            mInfo.className = NSStringFromClass(type(of: controller) as! AnyClass).components(separatedBy: ".").last!
            mInfo.className =  controller.zx_className
            mInfo.barItem = item
            
//            ZXPresentVCInfo.zxPresentVCsDic[String.init(format: "%d", (self.viewControllers?.count)!)] = mInfo
            ZXPresentVCInfo.zxPresentVCsDic["\((self.viewControllers?.count)!)"] = mInfo
            xxx_addChileViewController(UIViewController.init(), from: item)
        }else{
            if item.embedInNavigation,!controller.isKind(of: UINavigationController.self) {
                let nav = UINavigationController.init(rootViewController: controller)
                nav.tabBarItem.title = item.title
                self.addChildViewController(nav)
            }else{
                self.addChildViewController(controller)
            }
        }
    }
    
    final func zx_addChildViewController(_ controller:UIViewController!,fromPlistItemIndex index:Int) {
        let count = ZXTabbarConfig.barItems.count
        if count > 0 ,index < count{
            zx_addChildViewController(controller, fromItem: ZXTabbarConfig.barItems[index])
        }
    }
    
    final func xxx_addChileViewController(_ controller:UIViewController!,from item:ZXTabbarItem) {
        var normalImage = UIImage.init(named: item.normalImage)
        normalImage     = normalImage?.withRenderingMode(.alwaysOriginal)
        
        var selectedImage   = UIImage.init(named: item.selectedImage)
        selectedImage       = selectedImage?.withRenderingMode(.alwaysOriginal)
        
        controller.tabBarItem.image = normalImage
        controller.tabBarItem.selectedImage = selectedImage
        controller.tabBarItem.title = item.title
        
        self.addChildViewController(controller)
    }
    
    final class func zx_tabBarController(_ tabBarController:UITabBarController,shouldSelectViewController viewController:UIViewController!) -> Bool {
        var sIndex = -1
        if let viewcontrollers = tabBarController.viewControllers {
            for (index,value) in viewcontrollers.enumerated() {
                if value == viewController {
                    sIndex = index
                    break
                }
            }
        }
        if sIndex != -1 {
            guard let info = ZXPresentVCInfo.zxPresentVCsDic["\(sIndex)"]  else {
                return true
            }
            if info.barItem.showAsPresent {
                if let vcClass = NSClassFromString(info.className) as? UIViewController.Type {
                    let vc = vcClass.init()
                    if info.barItem.embedInNavigation,!vc.isKind(of: UINavigationController.self) {
                        tabBarController.present(UINavigationController.init(rootViewController: vc), animated: true, completion: nil)
                    }else{
                        tabBarController.present(vc, animated: true, completion: nil)
                    }
                    return false
                }
            }
        }
        return true;
    }
}

