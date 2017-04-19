//
//  HLConstant.swift
//  PopInstance
//
//  Created by 刘浩 on 2017/4/18.
//  Copyright © 2017年 刘浩. All rights reserved.
//

import UIKit

class HLConstant: NSObject {
    static let shared = HLConstant()
    public let classSection = ["隐式动画","显式动画"]
    public let classRow = [["",""],
                           ["PropertyAnimationViewController",
                            "KeyframeAnimationsViewController",
                            "VirtualPropertyAnimationViewController",
                            "GroupsAnimationViewController",
                            "TransitionsAnimationViewController",
                            "CustomTransitionsViewController"]]
}


extension UIColor {
    //返回随机颜色
    open class var randomColor : UIColor {
        get {
            let red = CGFloat(arc4random() % 256) / 255.0
            let green = CGFloat(arc4random() % 256) / 255.0
            let blue = CGFloat(arc4random() % 256) / 255.0
            return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        }
    }
}
