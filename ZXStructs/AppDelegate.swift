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
        vc.view.backgroundColor = UIColor.gray
        vc.title = "JustOnce"
        tabBar?.addChildViewController(vc)
        
        //4
        tabBar?.zx_addChildViewController(storyBoard.instantiateViewController(withIdentifier: "ZXTableVC"), fromPlistItemIndex: 4)
        
        //5 
        let itemInfo                = ZXTabbarItem()
        itemInfo.title              = "不一样"
        itemInfo.normalImage        = "tabbarIcon4-normal"
        itemInfo.selectedImage      = "tabbarIcon4-selected"
        itemInfo.showAsPresent      = false
        itemInfo.embedInNavigation  = true
        tabBar?.zx_addChildViewController(ZXHHViewController(), fromItem: itemInfo)
        
        window?.makeKeyAndVisible()
        
        //MARK: - Check Location
        ZXLocationUtils.shareInstance.checkCurrentLocation(completion: { (success, location, errorMsg) in
            if success,let location = location {
                print("latitude:\(location.coordinate.latitude),longitude:\(location.coordinate.longitude)")
            }else{
                print(errorMsg!)
            }
        })
        
        let tel = "1808100373"
        let pwd = "a123456"
        let email = "hulj 163.com"
        let sizeText = "fdhasjk 发的哈刷卡机"
        
        print(tel.zx_mobileValid())
        print(pwd.zx_passwordValid())
        print(email.zx_emailValid())
        print(sizeText.zx_textSize(toFont: UIFont.zx_titleFont(20), limiteSize: CGSize(width: 200, height: 200)))
        
        
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

