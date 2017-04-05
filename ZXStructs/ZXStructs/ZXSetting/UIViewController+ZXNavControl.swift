//
//  UIViewController+ZXNavControl.swift
//  ZXStructs
//
//  Created by screson on 2017/4/5.
//  Copyright © 2017年 screson. All rights reserved.
//

import UIKit

extension UIViewController {
    //MARK: - Navigation Control
    func zx_clearNavbarBackButtonTitle() {
        let backItem = UIBarButtonItem(title: " ", style: .plain, target: self, action: #selector(self.zx_popviewController(animated:)))
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backItem
    }
    
    func zx_popviewController(animated: Bool) {
        self.navigationController?.popViewController(animated: animated)
    }
}

