//
//  MessageModel.swift
//  wechat
//
//  Created by 王子健 on 16/4/10.
//  Copyright © 2016年 tencent. All rights reserved.
//

import Foundation
import ObjectMapper

class MessageModel : NSObject, wechatModelProtocal {
    
    var chatId:Int64?
    var senderId:String?
    var senderName:String?
    var messageSeq :Int64?
    var messageFromType:MessageFromType = MessageFromType.Personal
    var messaContentType:MessageContentType = MessageContentType.Text
    var messageContent:String?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        
    }

}
