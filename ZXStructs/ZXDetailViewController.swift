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
