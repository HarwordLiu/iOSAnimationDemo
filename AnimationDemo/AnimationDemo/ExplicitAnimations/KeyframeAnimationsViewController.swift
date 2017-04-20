//
//  KeyframeAnimationsViewController.swift
//  AnimationDemo
//
//  Created by 刘浩 on 2017/4/19.
//  Copyright © 2017年 刘浩. All rights reserved.
//

import UIKit

// MARK: 关键帧动画
class KeyframeAnimationsViewController: HLBaseViewController {
    
    let bezierPath = UIBezierPath()
    let pathLayer = CAShapeLayer()
    let shipLayer = CALayer()


    override func viewDidLoad() {
        super.viewDidLoad()
        addLayerView()
        configuration()
        // Do any additional setup after loading the view.
    }
    
    func configuration() {
        bezierPath.move(to: CGPoint(x: 0, y: 150))
        bezierPath.addCurve(to: CGPoint(x: 300, y: 150), controlPoint1: CGPoint(x: 75, y: 0), controlPoint2: CGPoint(x: 225, y: 300))
        
        pathLayer.path = bezierPath.cgPath
        pathLayer.fillColor = UIColor.randomColor.cgColor
        pathLayer.strokeColor = UIColor.randomColor.cgColor
        pathLayer.lineWidth = 3.0
        layerView.layer.addSublayer(pathLayer)
        
        shipLayer.frame = CGRect(x: 0, y: 0, width: 64, height: 64)
        shipLayer.position = CGPoint(x: 0, y: 150)
        shipLayer.contents = UIImage(named: "plane")?.cgImage
        layerView.layer.addSublayer(shipLayer)
        
    }
    
    override func tapLayerView(_ sender: UIButton) {
        shipLayer.removeAllAnimations()
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position"
        animation.duration = 5.0
        animation.path = bezierPath.cgPath
        animation.rotationMode = kCAAnimationRotateAuto
        shipLayer.add(animation, forKey: nil)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
