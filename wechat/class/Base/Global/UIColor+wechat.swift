//
//  UIColor+wechat.swift
//  wechat
//
//  Created by 王子健 on 16/4/9.
//  Copyright © 2016年 tencent. All rights reserved.
//

import Foundation
import UIColor_Hex_Swift

typealias wechatColor = UIColor.LocalColorName

extension UIColor{
    enum LocalColorName:String {
        case barTintColor = "#1A1A1A"  /*navigationbar 的颜色*/
        case tabbarSelectedTextColor = "#68BB1E"
        case viewBackgroundColor = "#E7EBEE"
    }
    
    convenience init(colorNamed name:LocalColorName) {
        self.init(rgba:name.rawValue)
    }
}