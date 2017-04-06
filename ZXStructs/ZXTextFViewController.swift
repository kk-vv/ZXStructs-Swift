//
//  ZXTextFViewController.swift
//  ZXStructs
//
//  Created by JuanFelix on 2017/4/6.
//  Copyright © 2017年 screson. All rights reserved.
//

import UIKit

class ZXTextFViewController: UIViewController {

    @IBOutlet weak var txtF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        self.zx_navbarAddBarButtonItems(textNames: ["取消"], font: nil, color: nil, position: .left)
        self.zx_clearNavbarBackButtonTitle()
        //
        self.zx_addKeyboardNotification()
    }
    
    override func zx_leftBarButtonAction(index: Int) {
        zx_popviewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.txtF.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //MARK: - KeyBoard Notice
    override func zx_keyboardWillShow(duration dt: Double, userInfo: Dictionary<String, Any>) {
        print("Show Animation Duration:\(dt)")
    }
    
    override func zx_keyboardWillHide(duration dt: Double, userInfo: Dictionary<String, Any>) {
        print("Hide Animation Duration:\(dt)")
    }
    
    override func zx_keyboardWillChangeFrame(beginRect: CGRect, endRect: CGRect, duration dt: Double, userInfo: Dictionary<String, Any>) {
        print("BeginRect:\(beginRect) EndRect:\(endRect)")
    }
    
    
    deinit {
        self.zx_removeKeyboardNotification()
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
