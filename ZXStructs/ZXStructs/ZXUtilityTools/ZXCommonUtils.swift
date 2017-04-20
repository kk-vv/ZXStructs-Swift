//
//  ZXCommonUtils.swift
//  ZXStructs
//
//  Created by JuanFelix on 2017/4/19.
//  Copyright © 2017年 screson. All rights reserved.
//

import UIKit

class ZXCommonUtils: NSObject {
    static func openURL(_ urlstr:String) {
        if #available(iOS 10.0, *) {
            if let url = URL(string: urlstr) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        } else {
            // Fallback on earlier versions
            if let url = URL(string: urlstr) {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    static func call(_ tel:String) {
        self.openURL("tel://\(tel)")
    }
    
    static func showNetworkActivityIndicator(_ show:Bool) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = show
    }
}
