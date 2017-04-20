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
        ZXLocationUtils.shareInstance.checkCurrentLocation(completion: { (status, location) in
            if status == .success,let location = location {
                print("latitude:\(location.coordinate.latitude),longitude:\(location.coordinate.longitude)")
            }else{
                print(status.description())
            }
        })
        
        let tel = "18081001111"
        let pwd = "a123654"
        let email = "fdhska@fhsa.com"
        let sizeText = "fdhasjk 发的哈刷卡机"
        let trueC = "你好"
        print(tel.zx_mobileValid())
        print(pwd.zx_passwordValid())
        print(email.zx_emailValid())
        print(trueC.zx_isChinese())
        print("Text Size: \(sizeText.zx_textRectSize(toFont: UIFont.zx_titleFont(20), limiteSize: CGSize(width: 200, height: 200)))")
        
        //Request
        ZXNetwork.showRequestLog = false
        ZXNetwork.timeoutInterval = 5
        ZXNetwork.asyncRequest(withUrl: "https://itunes.apple.com/search", params: ["term":"qq","limit":"1","entity":"software"], method: .get, completion: { (obj, stringValue) in
            //print("\(obj ?? "")")
        }, timeOut: { (errorMsg) in
            //print("TimeOut:\(errorMsg)")
        }) { (code, errorMsg) in
            //print("HttpError:\(code) \(errorMsg)")
        }
        
        
//        ZXNetwork.uploadImage(to: "https://192.168.0.81:8000/upload", images: [UIImage(named:"r1")!,UIImage(named:"r2")!], params: nil, compressRatio: 1, completion: { (obj, string) in
//            print("\(obj ?? "")")
//        }, timeOut: { (errorMsg) in
//            print("TimeOut:\(errorMsg)")
//        }) { (code, errorMsg) in
//            print("HttpError:\(code) \(errorMsg)")
//        }
        
 
        
        
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

