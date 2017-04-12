//
//  ZXStringTestViewController.swift
//  ZXStructs
//
//  Created by JuanFelix on 2017/4/10.
//  Copyright © 2017年 screson. All rights reserved.
//

import UIKit

class ZXStringTestViewController: UIViewController {

    @IBOutlet weak var lb1: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let string1 = "你敢发teststringa😁风华绝代卡萨123456"
        let attStr1 = NSAttributedString.zx_lineFormat(string1, type: .deleteLine, at: NSMakeRange(3, 5))
        attStr1.zx_appendColor(color: UIColor.red, at: NSMakeRange(0, 3))
        attStr1.zx_appendColor(color: UIColor.green, at: NSMakeRange(6, 2))
        attStr1.zx_appendFont(font: UIFont.zx_bodyFont(10), at: NSMakeRange(10, 6))
        lb1.attributedText = attStr1
        
        // 1
        let string = "Testing Attributed Strings" as NSString
        let attributedString = NSMutableAttributedString(string: string as String)
        
        // 2
        let firstAttributes = [NSForegroundColorAttributeName: UIColor.blue, NSBackgroundColorAttributeName: UIColor.yellow, NSUnderlineStyleAttributeName: 1] as [String : Any]
        let secondAttributes = [NSForegroundColorAttributeName: UIColor.red, NSBackgroundColorAttributeName: UIColor.blue, NSStrikethroughStyleAttributeName: 2] as [String : Any]
        let thirdAttributes = [NSForegroundColorAttributeName: UIColor.green, NSBackgroundColorAttributeName: UIColor.black, NSFontAttributeName: UIFont.systemFont(ofSize: 40)]
        
        // 3
        attributedString.addAttributes(firstAttributes, range: string.range(of: "Testing"))
        attributedString.addAttributes(secondAttributes, range: string.range(of: "Attributed"))
        attributedString.addAttributes(thirdAttributes, range: string.range(of: "Strings"))
        
        // 4
//        lb1.attributedText = attributedString
                
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
