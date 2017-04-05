//
//  ViewController.swift
//  ZXStructs
//
//  Created by JuanFelix on 2017/3/31.
//  Copyright © 2017年 screson. All rights reserved.
//

import UIKit

let code1 = "\u{e600}"
let code2 = "\u{e612}"
let code3 = "\u{e613}"
let code4 = "\u{e616}"

class ViewController: UIViewController {

    @IBOutlet weak var lbIconFont: UILabel!
    @IBOutlet weak var testView: UIView!
    @IBOutlet weak var lbMark: UILabel!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbBody: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Home Page"

        self.view.backgroundColor = UIColor.zx_backgroundColor
        
        testView.backgroundColor = UIColor.zx_tintColor
        testView.layer.borderWidth = 3
        testView.layer.borderColor = UIColor.zx_borderColor.cgColor
        
        print(UIDevice.zx_DeviceSizeType().description());
        
        self.lbTitle.textColor  = UIColor.zx_textColorTitle
        self.lbBody.textColor   = UIColor.zx_textColorBody
        self.lbMark.textColor   = UIColor.zx_textColorMark
        
        self.lbTitle.font   = UIFont.zx_titleFont
        self.lbBody.font    = UIFont.zx_bodyFont
        self.lbMark.font    = UIFont.zx_markFont
        //self.lbTitle.font   = UIFont.zx_bodyFont(14)
        self.lbIconFont.font    = UIFont.zx_iconFont(30)
        //self.lbIconFont.font    = UIFont(name: UIFont.zx_iconFontName, size: 30)
        //self.lbIconFont.font    = UIFont.zx_iconFont //默认正文字体大小
        self.lbIconFont.text    =   "Hi,\(code1)"
        self.lbIconFont.textColor   =   UIColor.zx_customCColor
        self.zx_clearNavbarBackButtonTitle()
        
        self.zx_navbarAddBarButtonItems(iconFontTexts: [code2,code3], fontSize: 30, color: UIColor.orange, position: .left)
        self.zx_navbarAddBarButtonItems(textNames: ["Call"], font: nil, color: nil, position: .right)
    }
    
    override func zx_leftBarButtonAction(index: Int) {
        print("Left Action At Index:\(index)")
    }
    
    override func zx_rightBarButtonAction(index: Int) {
        print("Right Action At Index:\(index)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

