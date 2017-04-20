//
//  ManualAnimationViewController.swift
//  AnimationDemo
//
//  Created by 刘浩 on 2017/4/20.
//  Copyright © 2017年 刘浩. All rights reserved.
//

import UIKit

// 这里只是展示了timeOffset的一种偷鸡用法
// 事实上这种跟随手势的动画直接设置门的transform会更简单
class ManualAnimationViewController: HLBaseViewController {
    
    let doorLayer = CALayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        addLayerView()
        configuration()
        // Do any additional setup after loading the view.
    }
    
    func configuration() {
        doorLayer.frame = CGRect(x: 0, y: 0, width: 128, height: 256)
        doorLayer.position = CGPoint(x: 150, y: 150)
        doorLayer.anchorPoint = CGPoint(x: 0, y: 0.5)
        doorLayer.contents = UIImage(named: "door")?.cgImage
        layerView.layer.addSublayer(doorLayer)
        
        var perspective = CATransform3DIdentity
        perspective.m34 = -1.0 / 500.0
        layerView.layer.sublayerTransform = perspective
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(panView(_:)))
        view.addGestureRecognizer(pan)
        
        doorLayer.speed = 0.0
        
        let animation = CABasicAnimation()
        animation.keyPath = "transform.rotation.y"
        animation.toValue = -(Double.pi * 2)
        animation.duration = 1.0
        doorLayer.add(animation, forKey: nil)
    }
    
    func panView(_ sender: UIPanGestureRecognizer) {
        var x = sender.translation(in: self.view).x
        
        x /= 200.0
        
        var timeOffset = CGFloat(doorLayer.timeOffset)
        timeOffset = min(0.999, max(0.0, timeOffset - x))
        doorLayer.timeOffset = CFTimeInterval(timeOffset)
        
        sender.setTranslation(CGPoint.zero, in: view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
