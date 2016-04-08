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

        // Do any additional setup after loading the view.
    }
    
    func setup() {
        let titleArray:NSArray = ["消息","好友","发现","我"]
        
        let viewControllerArray = [MessagesViewController(),FriendsViewController(),NewMomentViewController(),MyPageViewController()]
        
        let navArray = NSMutableArray()
        for (index, controller) in viewControllerArray.enumerate() {
            
            controller.tabBarItem!.title = titleArray.objectAtIndex(index) as! String
            
            
        }
        
        
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
