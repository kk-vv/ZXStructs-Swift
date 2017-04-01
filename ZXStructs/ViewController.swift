//
//  ViewController.swift
//  ZXStructs
//
//  Created by JuanFelix on 2017/3/31.
//  Copyright © 2017年 screson. All rights reserved.
//

import UIKit

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
        //self.lbTitle.font   = UIFont(name: UIFont.zx_fontNameBody, size: 22)
        self.lbIconFont.font    = UIFont(name: UIFont.zx_fontNameIconFont, size: 30)
        //self.lbIconFont.font    = UIFont.zx_iconFont //默认正文字体大小
        self.lbIconFont.text    =   "Hi,\u{e616}"
        self.lbIconFont.textColor   =   UIColor.zx_customCColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

