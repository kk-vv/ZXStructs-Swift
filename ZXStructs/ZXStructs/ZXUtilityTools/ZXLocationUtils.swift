//
//  ZXLocationUtils.swift
//  ZXStructs
//
//  Created by screson on 2017/4/7.
//  Copyright © 2017年 screson. All rights reserved.
//

import UIKit
import CoreLocation

typealias ZXCheckLocation = (Bool,CLLocation?,String?) -> Void
private let shareLocation = ZXLocationUtils()

class ZXLocationUtils: NSObject {
    
    var checkEnd: ZXCheckLocation?
    var located:  Bool = false
    var locating: Bool = false
    var manager:  CLLocationManager?
    
    class var shareInstance: ZXLocationUtils {
        return shareLocation
    }
    
    override init() {
        super.init()
        self.manager = CLLocationManager()
        self.manager?.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        self.manager?.requestWhenInUseAuthorization()
        self.manager?.delegate = self
    }
    
    func checkCurrentLocation(completion:ZXCheckLocation?) -> Void {
        if CLLocationManager.locationServicesEnabled() {
            let status = CLLocationManager.authorizationStatus()
            if status == .authorizedAlways || status == .authorizedWhenInUse {
                if locating {
                    completion?(false,nil,"上一次调用未结束,请稍后再试...")
                    return
                }else{
                    located = false
                }
                self.checkEnd = completion
                self.manager?.startUpdatingLocation()
                locating = true
            }else{
                switch status {
                case .notDetermined:
                    //用户还未做出位置使用权限选择
                    if locating {
                        completion?(false,nil,"上一次调用未结束,请稍后再试...")
                        return
                    }else{
                        located = false
                    }
                    self.checkEnd = completion
                    self.manager?.startUpdatingLocation()
                    locating = true
                case .restricted:
                    completion?(false,nil,"定位服务使用受限")
                case .denied:
                    completion?(false,nil,"用户阻止位置使用权限")
                default:
                    break
                }
            }
        }else{
            completion?(false,nil,"设备未开启定位服务")
        }
        let zxLocation = ZXLocationUtils()
        zxLocation.checkEnd = completion
    }
}

extension ZXLocationUtils: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        checkEnd?(false,nil,error.localizedDescription)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if located {
            return
        }
        located = true
        locating = false
        manager.stopUpdatingLocation()
        checkEnd?(true,locations.last,nil)
    }
}
