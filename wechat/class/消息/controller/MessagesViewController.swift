//
//  MessagesViewController.swift
//  wechat
//
//  Created by iprincewang on 16/4/6.
//  Copyright © 2016年 tencent. All rights reserved.
//

import UIKit

class MessagesViewController: UIViewController{

    var bottomTipsView : wechatBottomTipsView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "消息"
        self.view.backgroundColor = UIColor(colorNamed: wechatColor.viewBackgroundColor)
        
        self.navigationItem.rightButtonAction(wechatAsert.NavigationBae_Add.image) { (Void) -> Void in
            
            //点击操作的方法
            print("点击 + ")
            self.bottomTipsView.hide(!self.bottomTipsView.hidden)
        }
        
        self.bottomTipsView = wechatBottomTipsView()
        self.bottomTipsView.delegate = self
        self.view.addSubview(self.bottomTipsView)
        
        self.bottomTipsView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(UIEdgeInsetsMake(64, 0, 0, 0))
        }
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.bottomTipsView.hide(true)
    }

}

extension MessagesViewController:wechatBottimTipsViewDelegate{
    
    //MARK: - @wechatBottimTipsViewDelegate
    func clickedTipIndex(type: wechatBottimTipType) {
        switch type {
        case .GroupChat:
            print("clicked GroupChat...")
            break
        case .AddFriend:
            print("clicked AddFriend...")
            break
        case .Scan:
            print("clicked Scan...")
            break
        case .Payment:
            print("clicked Payment...")
            break
        }
    }
    
}
