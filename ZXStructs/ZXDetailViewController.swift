//
//  ZXDetailViewController.swift
//  ZXStructs
//
//  Created by JuanFelix on 2017/4/5.
//  Copyright © 2017年 screson. All rights reserved.
//

import UIKit

class ZXDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.zx_navbarAddBarButtonItems(imageNames: ["r1","r2"], useOriginalColor: true, at: .right)
        self.view.backgroundColor = UIColor.zx_backgroundColor
        
        self.zx_clearNavbarBackButtonTitle()
        //不设置，下一个VC navbar返回按钮会有文字
        //如果想在一处设置，使所有navbar都生效 1、通过runtime重写viewdidload 2、可继承于一个BaseViewController 3、设置上一个VC title为空 ... 4、或则你觉得更好的实现方式 
    }
    
    override func zx_rightBarButtonAction(index: Int) {
        print("Right Action At Index:\(index)")
        if let zxTextFVC = self.storyboard?.instantiateViewController(withIdentifier: "ZXTextFVC"){
            self.navigationController?.pushViewController(zxTextFVC, animated: true)
        }
    }
    
    @IBAction func switchAction(_ sender: UISwitch) {
        if !sender.isOn {
            self.zx_navbarAddBarButtonItems(imageNames: ["r1","r2"], useOriginalColor: false, at: .right)//红色来源于ZXNarBarConfig.plist中配置
        }else{
            self.zx_navbarAddBarButtonItems(imageNames: ["r1","r2"], useOriginalColor: true, at: .right)
        }
    }
    
    @IBAction func changeColor(_ sender: UIButton) {
        let r = (CGFloat)(arc4random() % 255) / 255.0
        let g = (CGFloat)(arc4random() % 255) / 255.0
        let b = (CGFloat)(arc4random() % 255) / 255.0
        self.zx_setnavbarBackgroundColor(UIColor(red: r, green: g, blue: b, alpha: 1.0))
        self.zx_settabbarBackgroundColor(UIColor(red: r, green: g, blue: b, alpha: 1.0))
    }

    @IBAction func clearColor(_ sender: Any) {
        self.zx_setnavbarBackgroundColor(UIColor.clear)
        self.zx_settabbarBackgroundColor(UIColor.clear)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.zx_setnavbarBackgroundColor(UIColor.zx_tintColor)
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
