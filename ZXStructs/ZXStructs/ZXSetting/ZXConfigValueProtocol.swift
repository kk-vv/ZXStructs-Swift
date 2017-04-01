//
//  ZXConfigUtils.swift
//  ZXStructs
//
//  Created by screson on 2017/4/1.
//  Copyright © 2017年 screson. All rights reserved.
//

import UIKit

protocol ZXConfigValueProtocol: class {
    static func configStringValue(forKey key: String!, defaultValue: String!) -> String!
    static func configFontSizeValue(forKey key:String, defaultSize:CGFloat) -> CGFloat
    static func configBoolValue(forKey key:String, defaultValue: Bool) -> Bool
}

extension ZXConfigValueProtocol {
    
    static func configFontSizeValue(forKey key:String, defaultSize:CGFloat) -> CGFloat {
        return 14.0
    }

    static func configBoolValue(forKey key:String, defaultValue: Bool) -> Bool {
        return false
    }
}
