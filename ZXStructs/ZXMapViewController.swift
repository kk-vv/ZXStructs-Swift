//
//  ZXMapViewController.swift
//  ZXStructs
//
//  Created by JuanFelix on 2017/4/7.
//  Copyright © 2017年 screson. All rights reserved.
//

import UIKit
import MapKit

class ZXMapViewController: UIViewController {

    lazy var imagePicker:ZXImagePickerUtils = {
        return ZXImagePickerUtils()
    }()
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.zx_navbarAddBarButtonItems(textNames: ["返回"], font: nil, color: UIColor.white, at: .left)
        
        mapView.setVisibleMapRect(MKMapRectMake(0, 0, 1000, 1000), animated: true)
    }
    
    override func zx_leftBarButtonAction(index: Int) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func takePhotoAction(_ sender: Any) {
        imagePicker.takePhoto(presentFrom: self) { [unowned self] (image, status) in
            if status == .success {
                self.imgView.image = image
            }else{
                if status == .denied {
                    ZXImagePickerUtils.showTips(at: self, type: .takePhoto)
                }else {
                    ZXAlertUtils.showAlert(withTitle: "提示", message: status.description())
                }
            }
        }
    }

    @IBAction func choosePhotoAction(_ sender: Any) {
        imagePicker.choosePhoto(presentFrom: self) {[unowned self] (image, status) in
            if status == .success {
                self.imgView.image = image
            }else{
                if status == .denied {
                    ZXImagePickerUtils.showTips(at: self, type: .choosePhoto)
                }else{
                    ZXAlertUtils.showAlert(withTitle: "提示", message: status.description())
                }
            }
        }
    }
    
    @IBAction func showAlert(_ sender: Any) {
        ZXAlertUtils.showAlert(wihtTitle: "Menu", message: "MebuInfo", buttonTexts: ["1","2","3"]) { (index) in
            print(index)
        }
    }
    
    @IBAction func showActionSheet(_ sender: Any) {
        ZXAlertUtils.showActionSheet(withTitle: "Menu", message: "MebuInfo", buttonTexts: ["1","2","3"], cancelText: nil) { (index) in
            print(index)
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
