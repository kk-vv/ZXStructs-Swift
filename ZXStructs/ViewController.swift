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
    var type = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.title = "Home Page"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        //Main UI Color
        self.view.backgroundColor = UIColor.zx_backgroundColor
        
        testView.backgroundColor = UIColor.zx_tintColor
        testView.layer.borderWidth = 3
        testView.layer.borderColor = UIColor.zx_borderColor.cgColor
        
        //Text Color
        self.lbTitle.textColor  = UIColor.zx_textColorTitle //Title Color
        self.lbBody.textColor   = UIColor.zx_textColorBody  //Body Color
        self.lbMark.textColor   = UIColor.zx_textColorMark  //Mark Color

        //Font
        self.lbTitle.font   = UIFont.zx_titleFont           //Title Font
        self.lbBody.font    = UIFont.zx_bodyFont            //Body Font
        self.lbMark.font    = UIFont.zx_markFont            //Mark Text Font
        //self.lbTitle.font   = UIFont.zx_bodyFont(14)
        self.lbIconFont.font    = UIFont.zx_iconFont(30)    //Iconfont
        //self.lbIconFont.font    = UIFont(name: UIFont.zx_iconFontName, size: 30)
        //self.lbIconFont.font    = UIFont.zx_iconFont //默认正文字体大小
        self.lbIconFont.text        =   "IconFont,\(code1)"
        self.lbIconFont.textColor   =   UIColor.zx_customCColor
        
        self.zx_clearNavbarBackButtonTitle()
        
        //Add Bar Button Item
        self.zx_navbarAddBarButtonItems(iconFontTexts: [code2,code3], fontSize: 30, color: UIColor.orange, at: .left)
        self.zx_navbarAddBarButtonItems(textNames: ["Call"], font: nil, color: UIColor.white, at: .right)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.zx_setnavbarBackgroundColor(UIColor.zx_navBarColor)
    }
    
    //MARK: - Left Bar Button Action
    override func zx_leftBarButtonAction(index: Int) {
        print("Left Action At Index:\(index)")
    }
    //MARK: Right Bar Button Action
    override func zx_rightBarButtonAction(index: Int) {
        print("Right Action At Index:\(index)")
    }
    
    //MARK: - Play Sound
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let index = type % 3
        switch index {
        case 0:
            //MARK: - Check Location
            ZXAudioUtils.vibrate()
        case 1:
            ZXAudioUtils.play(forResource: "soundA.caf", ofType:nil)
        case 2:
            ZXAudioUtils.play(withId: 1016)
        default: break
            
        }
        type += 1
        type = type % 100
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

