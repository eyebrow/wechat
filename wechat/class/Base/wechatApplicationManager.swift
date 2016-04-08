//
//  wechatApplicationManager.swift
//  wechat
//
//  Created by iprincewang on 16/4/8.
//  Copyright © 2016年 tencent. All rights reserved.
//

import UIKit

class wechatApplicationManager: NSObject {

    static func applicationConfigInit() {
        self.initNavigationBar()
        self.initNotifications()
    }
    
    /**
     Custom NavigationBar
     */
    static func initNavigationBar() {
        UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: true)
        UINavigationBar.appearance().barTintColor = UIColor(red: 0x1a, green: 0x1a, blue: 0x1a, alpha: 1)
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        UINavigationBar.appearance().translucent = true
        let attributes = [
            NSFontAttributeName: UIFont.systemFontOfSize(19.0),
            NSForegroundColorAttributeName: UIColor.whiteColor()
        ]
        UINavigationBar.appearance().titleTextAttributes = attributes
    }
    
    /**
     Register remote notification
     */
    static func initNotifications() {
        
        let settings = UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound], categories: nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(settings)
        UIApplication.sharedApplication().registerForRemoteNotifications()
    }
}
