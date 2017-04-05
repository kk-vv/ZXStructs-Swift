//
//  UIViewController+ZX.swift
//  ZXStructs
//
//  Created by screson on 2017/4/5.
//  Copyright © 2017年 screson. All rights reserved.
//

import UIKit

extension UIViewController {
    func zx_addKeyboardNotification() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(xxx_baseKeyboardWillShow(notice:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        notificationCenter.addObserver(self, selector: #selector(xxx_baseKeyboardWillHide(notice:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        notificationCenter.addObserver(self, selector: #selector(xxx_baseKeyboardWillChangeFrame(notice:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
    }
    
    func zx_removeKeyboardNotification() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        notificationCenter.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        notificationCenter.removeObserver(self, name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
    }
    
    func zx_keyboardWillShow(duration dt: Double,notice:Notification) {
        
    }
    
    func zx_keyboardWillHide(duration dt: Double,notice:Notification) {
        
    }
    
    func zx_keyboardWillChangeFrame(beginRect rect1:CGRect,endRect rect2: CGRect,duration dt:Double,notice:Notification) {
        
    }
    
    //MARK: - 
    final func xxx_baseKeyboardWillShow(notice:Notification) {
        if let userInfo = notice.userInfo as? Dictionary<String, Any> {
//            zx_keyboardWillShow(duration: userInfo, notice: Notification)
        }
//         [self zx_keyboardWillShowTimeInteval:[notice.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue] notice:notice];
    }
    
    final func xxx_baseKeyboardWillHide(notice:Notification) {
//        [self zx_keyboardWillHideTimeInteval:[notice.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue] notice:notice];
        
    }
    
    final func xxx_baseKeyboardWillChangeFrame(notice:Notification) {
//        CGRect beginKeyboardRect = [[notice.userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
//        CGRect endKeyboardRect = [[notice.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
//        [self zx_keyboardWillChangeFrameBeginRect:beginKeyboardRect endRect:endKeyboardRect timeInterval:[notice.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue] notice:notice];
    }
    
    
}
