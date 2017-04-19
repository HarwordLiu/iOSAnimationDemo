//
//  VirtualPropertyAnimationViewController.swift
//  AnimationDemo
//
//  Created by 刘浩 on 2017/4/19.
//  Copyright © 2017年 刘浩. All rights reserved.
//

import UIKit

// MARK: 虚拟属性动画
class VirtualPropertyAnimationViewController: HLBaseViewController {
    let shipLayer = CALayer()
    let animation = CABasicAnimation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addLayerView()
        configuration()
    }
    
    func configuration() {
        
        shipLayer.frame = CGRect(x: 0, y: 0, width: 128, height: 128)
        shipLayer.position = CGPoint(x: 150, y: 150)
        shipLayer.contents = UIImage(named: "plane")?.cgImage
        layerView.layer.addSublayer(shipLayer)
        
    }
    
    override func tapLayerView(_ sender: UIButton) {
        
        animation.keyPath = "transform.rotation.z"
        animation.duration = 2.0
        animation.byValue = Double.pi * 2
        shipLayer.add(animation, forKey: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
