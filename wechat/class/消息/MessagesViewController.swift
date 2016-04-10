//
//  MessagesViewController.swift
//  wechat
//
//  Created by iprincewang on 16/4/6.
//  Copyright © 2016年 tencent. All rights reserved.
//

import UIKit

class MessagesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "消息"
        self.view.backgroundColor = UIColor(colorNamed: wechatColor.viewBackgroundColor)
        
        self.navigationItem.rightButtonAction(wechatAsert.NavigationBae_Add.image) { (Void) -> Void in
            
            //点击操作的方法
            print("点击 + ")
        }
    }
}
