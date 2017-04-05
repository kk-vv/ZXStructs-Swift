//
//  ZXDetailViewController.swift
//  ZXStructs
//
//  Created by screson on 2017/4/5.
//  Copyright © 2017年 screson. All rights reserved.
//

import UIKit

class ZXDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.zx_navbarAddBarButtonItems(imageNames: ["r1","r2"], useOriginalColor: true, position: .right)
        self.view.backgroundColor = UIColor.zx_backgroundColor
    }
    
    override func zx_rightBarButtonAction(index: Int) {
        print("Right Action At Index:\(index)")
    }
    
    @IBAction func switchAction(_ sender: UISwitch) {
        if !sender.isOn {
            self.zx_navbarAddBarButtonItems(imageNames: ["r1","r2"], useOriginalColor: false, position: .right)//红色来源于ZXNarBarConfig.plist中配置
        }else{
            self.zx_navbarAddBarButtonItems(imageNames: ["r1","r2"], useOriginalColor: true, position: .right)
        }
    }
    
    @IBAction func changeColor(_ sender: UIButton) {
        let r = (CGFloat)(arc4random() % 255) / 255.0
        let g = (CGFloat)(arc4random() % 255) / 255.0
        let b = (CGFloat)(arc4random() % 255) / 255.0
        self.zx_setnavbarBackgroundColor(UIColor(red: r, green: g, blue: b, alpha: 1.0))
    }

    @IBAction func clearColor(_ sender: Any) {
        self.zx_setnavbarBackgroundColor(UIColor.clear)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
