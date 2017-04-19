//
//  PropertyAnimationViewController.swift
//  AnimationDemo
//
//  Created by 刘浩 on 2017/4/19.
//  Copyright © 2017年 刘浩. All rights reserved.
//

import UIKit

// MARK: 属性动画
class PropertyAnimationViewController: HLBaseViewController, CAAnimationDelegate {
    
    let colorLayer = CALayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addLayerView()
        configuration()
    
    }
    
    func configuration() {
        colorLayer.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        colorLayer.backgroundColor = UIColor.randomColor.cgColor
        layerView.layer.addSublayer(colorLayer)
    }
    
    override func tapLayerView(_ sender: UIButton) {
        let animation = CABasicAnimation()
        animation.keyPath = "backgroundColor"
        animation.toValue = UIColor.randomColor.cgColor
        animation.delegate = self
        animation.duration = 5.0
        colorLayer.add(animation, forKey: nil)
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        let tempAni = anim as! CABasicAnimation
        let cgColor = tempAni.toValue as! CGColor
        
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        layerView.backgroundColor = UIColor(cgColor: cgColor)
        CATransaction.commit()
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
