//
//  UIImage+wechat.swift
//  wechat
//
//  Created by 王子健 on 16/4/9.
//  Copyright © 2016年 tencent. All rights reserved.
//

import Foundation

typealias wechatAsert = UIImage.Asert

extension UIImage{
    
    enum Asert:String{
        
//MARK: - 底部tabBar图片
        case Tabbar_badge = "tabbar_badge"
        case Tabbar_contacts = "tabbar_contacts"
        case Tabbar_contactsHL = "tabbar_contactsHL"
        case Tabbar_discover = "tabbar_discover"
        case Tabbar_discoverHL = "tabbar_discoverHL"
        case Tabbar_mainframe = "tabbar_mainframe"
        case Tabbar_mainframeHL = "tabbar_mainframeHL"
        case Tabbar_me = "tabbar_me"
        case Tabbar_meHL = "tabbar_meHL"
        case TabbarBkg = "tabbarBkg"
        
//MARK: - 右上角以及tipsView
        case NavigationBae_Add = "barbuttonicon_add"
        case MessageRightTopBg = "MessageRightTopBg"
        case Contacts_add_newmessage = "Contacts_add_newmessage"
        case Barbuttonicon_add_cube = "barbuttonicon_add_cube"
        case Contacts_add_scan = "contacts_add_scan"
        case Receipt_payment_icon = "receipt_payment_icon"
    
        
        var image: UIImage {
            return UIImage(asert: self)
        }

    }
    
    convenience init!(asert:Asert){
        self.init(named: asert.rawValue)
        
    }
}