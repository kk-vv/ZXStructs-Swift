//
//  ZXHHViewController.swift
//  ZXStructs
//
//  Created by JuanFelix on 2017/4/7.
//  Copyright © 2017年 screson. All rights reserved.
//

import UIKit

class ZXHHViewController: UIViewController {

    //1
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.view.backgroundColor = UIColor.gray
        self.title = "是不一样"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //2
        //self.title = "一样"
        // Do any additional setup after loading the view.
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 30))
        view.backgroundColor = UIColor.clear
        let btn1 = UIButton(type: .custom)
        btn1.tag = 111
        btn1.backgroundColor = UIColor.clear
        btn1.addTarget(self, action: #selector(self.customAction(sender:)), for: .touchUpInside)
        btn1.setImage(UIImage(named:"tabbarIcon5-selected"), for: .normal)
        btn1.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        view.addSubview(btn1)
        
        let btn2 = UIButton(type: .custom)
        btn2.tag = 222
        btn2.backgroundColor = UIColor.clear
        btn2.addTarget(self, action: #selector(self.customAction(sender:)), for: .touchUpInside)
        btn2.setImage(UIImage(named:"tabbarIcon4-selected"), for: .normal)
        btn2.frame = CGRect(x: 30, y: 0, width: 30, height: 30)
        view.addSubview(btn2)
        
        self.zx_navbarAddBarButtonItem(customView: view, at: .right)
        let webView = UIWebView.init(frame: self.view.frame)
        webView.loadRequest(URLRequest.init(url: URL(string: "https://www.bing.com")!))
        self.view.addSubview(webView)
        
    }
    
    func customAction(sender:UIButton) {
        print(sender.tag)
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
