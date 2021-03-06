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
    private var tableView:UITableView!
    private var dataSource = [MessageModel]()
    
    override func loadView() {
        super.loadView()
        self.tableView = UITableView()
        self.tableView.frame = self.view.bounds
        self.tableView.estimatedRowHeight = 65
        
        self.view.addSubview(self.tableView)
    }
    
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

extension MessagesViewController:UITableViewDelegate{
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}

extension MessagesViewController:UITableViewDataSource{
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return self.tableView.estimatedRowHeight
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("MessageTableViewCell", forIndexPath: indexPath) as! MessageTableViewCell
        
        cell .setContent(MessageModel: self.dataSource.get(indexPath.row))
        
        return cell
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
