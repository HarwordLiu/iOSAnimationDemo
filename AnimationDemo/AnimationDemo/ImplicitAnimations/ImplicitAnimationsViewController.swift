//
//  ImplicitAnimationsViewController.swift
//  AnimationDemo
//
//  Created by 刘浩 on 2017/4/19.
//  Copyright © 2017年 刘浩. All rights reserved.
//

import UIKit

// MARK: 隐式动画
// ps: UIKit是建立在CALayer之上的，UIKit将自带的属性的隐式动画都给禁用了
//     UIView关联的图层禁用了隐式动画，对这种图层做动画的唯一办法就是使用UIView的动画函数（而不是依赖CATransaction），或者继承UIView，并覆盖-actionForLayer:forKey:方法，或者直接创建一个显式动画。
//      对于单独存在的图层，我们可以通过实现图层的-actionForLayer:forKey:委托方法，或者提供一个actions字典来控制隐式动画。

// 所以鄙人愚建，这个东西知道即可。


class ImplicitAnimationsViewController: HLBaseViewController {

    let colorLayer = CALayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addLayerView()
        configuration()
        // Do any additional setup after loading the view.
    }
    
    func configuration() {
        colorLayer.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        colorLayer.backgroundColor = UIColor.randomColor.cgColor
        
        layerView.layer.addSublayer(colorLayer)
    }
    
    override func tapLayerView(_ sender: UIButton) {
        /* 
         可以使用CATransaction 
         来设置动画时间 default = 0.25s
         设置动画结束block
         时间函数
         。。。
        */
        
        unowned let weakSelf = self
        
        CATransaction.begin()
        CATransaction.setAnimationDuration(1.0)
        CATransaction.setCompletionBlock { 
            var tranform = weakSelf.colorLayer.affineTransform()
            tranform = tranform.rotated(by: CGFloat(Double.pi))
            weakSelf.colorLayer.setAffineTransform(tranform)
        }
        
        colorLayer.backgroundColor = UIColor.randomColor.cgColor
        
        CATransaction.commit()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
