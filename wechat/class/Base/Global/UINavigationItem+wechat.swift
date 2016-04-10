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
        
        //点击回调 - 两种写法
// 1.
//        button.wechat_addAction(forControlEvents: .TouchUpInside, withcallback: {
//            handler()
//        })
//
        
// 2.
        button.wechat_addAction(forControlEvents: .TouchUpInside) { (Void) -> Void in
            handler()
        }
        //添加到right
        let barItem = UIBarButtonItem(customView: button)
        let gapItem = UIBarButtonItem(barButtonSystemItem: .FixedSpace, target: nil, action: nil)
        
        self.rightBarButtonItems = [barItem,gapItem]
    }
    
}

// MARK: - @block of envent control

public class ClosureWrapper:NSObject{
    
    let _callBack : (Void) -> Void
    
    init(callBack:(Void) -> Void) {
        _callBack = callBack
    }
    
    public func invork () {
        _callBack()
    }
    
}

var AssociatedClosure:UInt8 = 0

extension UIControl{
    
    private func wechat_addAction(forControlEvents events:UIControlEvents,withcallback caback:(Void) -> Void){
        let wapper = ClosureWrapper(callBack: caback)
        addTarget(wapper, action: #selector(ClosureWrapper.invork), forControlEvents: events)
        
        objc_setAssociatedObject(self, &AssociatedClosure, wapper, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
}