//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

print(str)

typealias ActionHandler = (String) -> Void

func rightButtonAction(nameed name:String,Hander handler:ActionHandler)  {
    
    print("rightButton create...")
    
    print("action start...")
    
    handler(name)
    
    print("action end...")
}

rightButtonAction(nameed: "prince ") { (String) -> Void in
    
    print("action...")
}

func test()  {
    
}