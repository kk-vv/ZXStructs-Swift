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
        ZXStructs.loadnavBarConfig()
        ZXStructs.loadtabBarConfig()
        //ZXStructs.loadUIConfig()
        //1  DemoVC
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let demoVC = storyBoard.instantiateViewController(withIdentifier: "ZXDemoNavVC")
        
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
        let itemInfo = ZXTabbarItem()
        itemInfo.title = "呵呵"
        itemInfo.normalImage    = "tabbarIcon4-normal"
        itemInfo.selectedImage  = "tabbarIcon4-selected"
        itemInfo.showAsPresent  = false
        itemInfo.embedInNavigation = true
        tabBar?.zx_addChildViewController(UIViewController.init(), fromItem: itemInfo)
        
        window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

//MARK: ------
//MARK: if tabitem set showAsPresent,must call this
extension AppDelegate: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return UITabBarController.zx_tabBarController(tabBarController,shouldSelectViewController:viewController)
    }
}

