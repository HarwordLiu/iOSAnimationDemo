//
//  GroupsAnimationViewController.swift
//  AnimationDemo
//
//  Created by 刘浩 on 2017/4/19.
//  Copyright © 2017年 刘浩. All rights reserved.
//

import UIKit

// MARK: 动画组
class GroupsAnimationViewController: HLBaseViewController {
    
    let bezierPath = UIBezierPath()
    let pathLayer = CAShapeLayer()
    let colorLayer = CALayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addLayerView()
        configuration()
    }
    
    func configuration() {
        bezierPath.move(to: CGPoint(x: 0, y: 150))
        bezierPath.addCurve(to: CGPoint(x: 300, y: 150), controlPoint1: CGPoint(x: 75, y: 0), controlPoint2: CGPoint(x: 225, y: 300))
        
        pathLayer.path = bezierPath.cgPath
        pathLayer.fillColor = UIColor.randomColor.cgColor
        pathLayer.strokeColor = UIColor.clear.cgColor
        pathLayer.lineWidth = 3.0
        layerView.layer.addSublayer(pathLayer)
        
        colorLayer.frame = CGRect(x: 0, y: 0, width: 64, height: 64)
        colorLayer.position = CGPoint(x: 0, y: 150)
        colorLayer.backgroundColor = UIColor.randomColor.cgColor
        layerView.layer.addSublayer(colorLayer)
    }
    
    override func tapLayerView(_ sender: UIButton) {
        colorLayer.removeAllAnimations()
        let animation1 = CAKeyframeAnimation()
        animation1.keyPath = "position"
        animation1.path = bezierPath.cgPath
        animation1.rotationMode = kCAAnimationRotateAuto
        
        let animation2 = CABasicAnimation()
        animation2.keyPath = "backgroundColor"
        animation2.toValue = UIColor.randomColor.cgColor
        
        let animation = CAAnimationGroup()
        animation.animations = [animation1, animation2]
        animation.duration = 4.0
        
        
        colorLayer.add(animation, forKey: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
