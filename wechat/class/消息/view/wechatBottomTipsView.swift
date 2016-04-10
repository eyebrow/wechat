//
//  wechatBottomTipsView.swift
//  wechat
//
//  Created by 王子健 on 16/4/10.
//  Copyright © 2016年 tencent. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import Cent
import RxCocoa

private let kActionViewWidth: CGFloat = 140   //container view width
private let kActionViewHeight: CGFloat = 190    //container view height
private let kActionButtonHeight: CGFloat = 44   //button height
private let kFirstButtonY: CGFloat = 12 //the first button Y value

//MARK: - @wechatBottomTipsViewDelegate
protocol wechatBottimTipsViewDelegate :class {
    
    func clickedTipIndex(type: wechatBottimTipType)
}

enum wechatBottimTipType :Int {
    case GroupChat = 0, AddFriend, Scan, Payment
}

//MARK: - @wechatBottmTipsView
class wechatBottomTipsView: UIView {
    
    let disposeBag = DisposeBag()
    weak var delegate:wechatBottimTipsViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initContentView()
    }
    
    convenience init(){
        self.init(frame: CGRect.zero)
        self.initContentView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func initContentView() {
        self.backgroundColor = UIColor.clearColor()
        
        let actionImages = [
            wechatAsert.Contacts_add_newmessage.image,
            wechatAsert.Barbuttonicon_add_cube.image,
            wechatAsert.Contacts_add_scan.image,
            wechatAsert.Receipt_payment_icon.image,
        ]
        
        let actionTitles = [
            "发起群聊",
            "添加朋友",
            "扫一扫",
            "收付款",
            ]
        
        //添加一个view
        let contentView = UIView()
        contentView.backgroundColor = UIColor.clearColor()
        self.addSubview(contentView)
        contentView.snp_makeConstraints { (make) in
            make.top.equalTo(self.snp_top).offset(3)
            make.right.equalTo(self.snp_right).offset(-5)
            make.width.equalTo(kActionViewWidth)
            make.height.equalTo(kActionViewHeight)
        }
        
        //view上添加一个图片 |--^-|
        let stretchInsets = UIEdgeInsetsMake(14,6,6,34)
        let bubbleImage = wechatAsert.MessageRightTopBg.image.resizableImageWithCapInsets(stretchInsets, resizingMode: .Stretch)
        let bgImageView = UIImageView(image: bubbleImage)
        contentView.addSubview(bgImageView)
        bgImageView.snp_makeConstraints { (make) in
            make.edges.equalTo(contentView)
        }
        
        //init custom buttons
        var yValue = kFirstButtonY
        for index in 0 ..< actionImages.count {
            let itemButton: UIButton = UIButton(type: .Custom)
            itemButton.backgroundColor = UIColor.clearColor()
            itemButton.titleLabel!.font = UIFont.systemFontOfSize(17)
            itemButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            itemButton.setTitleColor(UIColor.whiteColor(), forState: .Highlighted)
            itemButton.setTitle(actionTitles.get(index), forState: .Normal)
            itemButton.setTitle(actionTitles.get(index), forState: .Highlighted)
            itemButton.setImage(actionImages.get(index), forState: .Normal)
            itemButton.setImage(actionImages.get(index), forState: .Highlighted)
            itemButton.addTarget(self, action: #selector(wechatBottomTipsView.buttonTaped(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            itemButton.contentHorizontalAlignment = .Left
            itemButton.contentEdgeInsets = UIEdgeInsetsMake(0, 12, 0, 0)
            itemButton.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0)
            itemButton.tag = index
            contentView.addSubview(itemButton)
            
            itemButton.snp_makeConstraints { (make) -> Void in
                make.top.equalTo(contentView.snp_top).offset(yValue)
                make.right.equalTo(contentView.snp_right)
                make.width.equalTo(contentView.snp_width)
                make.height.equalTo(kActionButtonHeight)
            }
            yValue += kActionButtonHeight
        }
        
        //add tap to view
        let tap = UITapGestureRecognizer()
        self.addGestureRecognizer(tap)
        
        tap.rx_event.subscribeNext { _ in
            self.hide(true)
            }.addDisposableTo(self.disposeBag)
        
        self.hidden = true
    }
    
    func buttonTaped(sender: UIButton!) {
        guard let delegate = self.delegate else {
            self.hide(true)
            return
        }
        
        let type = wechatBottimTipType(rawValue:sender.tag)!
        delegate.clickedTipIndex(type)
        self.hide(true)
    }
    
    /**
     Hide the float view
     
     - parameter hide: is hide
     */
    func hide(hide: Bool) {
        if hide {
            self.alpha = 1.0
            UIView.animateWithDuration(0.2 ,
                                       animations: {
                                        self.alpha = 0.0
                },
                                       completion: { finish in
                                        self.hidden = true
                                        self.alpha = 1.0
            })
        } else {
            self.alpha = 1.0
            self.hidden = false
        }
    }

}
