//
//  AppDelegate.swift
//  ZXStructs
//
//  Created by JuanFelix on 2017/3/31.
//  Copyright © 2017年 screson. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var tabBar: UITabBarController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        tabBar = UITabBarController.init()
        tabBar?.delegate = self
        window?.rootViewController = tabBar
        
        //
        //ZXStructs.loadnavBarConfig()
        //ZXStructs.loadtabBarConfig()
        ZXStructs.loadUIConfig()
        //1  DemoVC
        let storyBoard  = UIStoryboard.init(name: "Main", bundle: nil)
        let demoVC      = storyBoard.instantiateViewController(withIdentifier: "ZXDemoNavVC")
        tabBar?.zx_addChildViewController(demoVC, fromPlistItemIndex: 0)
        
        //2 MapVC
        tabBar?.zx_addChildViewController(ZXMapViewController(), fromPlistItemIndex: 2)//every index u like
    
        //3 JustOnce
        let vc = UIViewController.init()
        vc.view.backgroundColor = UIColor.red
        vc.title = "JustOnce"
        tabBar?.addChildViewController(vc)
        
        //4
        tabBar?.zx_addChildViewController(UIViewController.init(), fromPlistItemIndex: 4)
        
        //5 
        let itemInfo                = ZXTabbarItem()
        itemInfo.title              = "不一样"
        itemInfo.normalImage        = "tabbarIcon4-normal"
        itemInfo.selectedImage      = "tabbarIcon4-selected"
        itemInfo.showAsPresent      = false
        itemInfo.embedInNavigation  = true
        tabBar?.zx_addChildViewController(ZXHHViewController(), fromItem: itemInfo)
        
        window?.makeKeyAndVisible()
        return true
    }
}

//MARK: ------
//MARK: if tabitem set showAsPresent,must call this
extension AppDelegate: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return UITabBarController.zx_tabBarController(tabBarController,shouldSelectViewController:viewController)
    }
}

