//
//  BaseTableBarController.swift
//  wechat
//
//  Created by iprincewang on 16/4/8.
//  Copyright © 2016年 tencent. All rights reserved.
//

import UIKit

class BaseTableBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self .setup()
        // Do any additional setup after loading the view.
    }
    
    func setup() {
        let titleArray:NSArray = ["消息","好友","发现","我"]
        
        let normalImagesArray:NSArray = [
            wechatAsert.Tabbar_mainframe.image,
            wechatAsert.Tabbar_contacts.image,
            wechatAsert.Tabbar_discover.image,
            wechatAsert.Tabbar_me.image,
        ]
        
        let selectedImagesArray:NSArray = [
            wechatAsert.Tabbar_mainframeHL.image,
            wechatAsert.Tabbar_contactsHL.image,
            wechatAsert.Tabbar_discoverHL.image,
            wechatAsert.Tabbar_meHL.image,
        ]
        
        let viewControllerArray = [MessagesViewController(),
                                   FriendsViewController(),
                                   NewMomentViewController(),
                                   MyPageViewController()
        ]
        
        let navArray = NSMutableArray()
        for (index, controller) in viewControllerArray.enumerate() {
            
            controller.tabBarItem!.title = titleArray.objectAtIndex(index) as? String
            
            controller.tabBarItem!.image = normalImagesArray.objectAtIndex(index).imageWithRenderingMode(.AlwaysOriginal)
            controller.tabBarItem!.selectedImage = selectedImagesArray.objectAtIndex(index).imageWithRenderingMode(.AlwaysOriginal)
            controller.tabBarItem!.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.lightGrayColor()], forState: .Normal)
            controller.tabBarItem!.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor(colorNamed: wechatColor.tabbarSelectedTextColor)], forState: .Selected)
            
            let navigationController = UINavigationController(rootViewController: controller)
            
            navArray.addObject(navigationController)
        }
        
        self.viewControllers = navArray.mutableCopy() as! [UINavigationController]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
