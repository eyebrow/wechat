//
//  wechatModel.swift
//  wechat
//
//  Created by 王子健 on 16/4/10.
//  Copyright © 2016年 tencent. All rights reserved.
//

import UIKit
import ObjectMapper

typealias wechatModelProtocal = ObjectMapper.Mappable
typealias wechatMapper = ObjectMapper.Mapper



enum GenderType:Int{
    case Female = 0, Male
}

enum MessageContentType:Int {
    
    /* 消息内容类型:
     0 - 文本
     1 - 图片
     2 - 语音
     3 - 视频
     4 - 系统提示信息
     5 - 文件
     ...
     110 - 时间（客户端生成数据）
     */
    
    case Text = 0
    case Image = 1
    case Voice = 2
    case Vedio = 3
    case System = 4
    case File = 5
    case Time = 110
}

enum MessageFromType:Int {
    
    //消息来源类型
    case System = 0   // 0是系统
    case Personal = 1   // 1是个人
    case Group  = 2 // 2是群组
    case PublicServer = 3  // 服务号
    case PublicSubscribe = 4   //订阅号
}


enum MessageSendType: Int {
    
    //发送消息的状态
    case Success = 0    //消息发送成功
    case Failed     //消息发送失败
    case Sending    //消息正在发送
}
