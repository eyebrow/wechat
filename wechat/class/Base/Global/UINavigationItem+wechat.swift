//
//  UINavigationItem+wechat.swift
//  wechat
//
//  Created by 王子健 on 16/4/10.
//  Copyright © 2016年 tencent. All rights reserved.
//

import Foundation

typealias ActionHandler = (Void) -> Void

extension UINavigationItem {
    
    func rightButtonAction(image:UIImage,handler:ActionHandler) {
        //初始化子view button
        let button:UIButton = UIButton(type: .Custom)
        button.setImage(image, forState: .Normal)
        button.frame = CGRectMake(0, 0, 40, 30)
        button.imageView?.contentMode = .ScaleAspectFit
        button.contentHorizontalAlignment = .Right
        
        //点击回调
        
        
        //添加到right
        let barItem = UIBarButtonItem(customView: button)
        let gapItem = UIBarButtonItem(barButtonSystemItem: .FixedSpace, target: nil, action: nil)
        
        self.rightBarButtonItems = [barItem,gapItem]
    }
    
}

public class ClosureWrapper:NSObject{
    
    let _callBack : (Void) -> Void
    
    init(callBack:(Void) -> Void) {
        _callBack = callBack
    }
    
    public func invork () {
        _callBack()
    }
    
}

extension UIControl{
    
    
}