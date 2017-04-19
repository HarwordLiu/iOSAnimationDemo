//
//  TransitionsAnimationViewController.swift
//  AnimationDemo
//
//  Created by 刘浩 on 2017/4/19.
//  Copyright © 2017年 刘浩. All rights reserved.
//

import UIKit

// MARK: 转场动画
class TransitionsAnimationViewController: HLBaseViewController {

    let imageArrays = [UIImage(named: "plane"), UIImage(named: "plane2")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addLayerView()
        configuration()

    }
    
    func configuration() {
        layerView.setImage(imageArrays[0], for: .normal)
    }
    
    override func tapLayerView(_ sender: UIButton) {
        let transition = CATransition()
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromTop
        layerView.layer.add(transition, forKey: nil)
        
        let currentImage = layerView.image(for: .normal)
        var index = imageArrays.index {
            $0 == currentImage
        }
        
        index = (index! + 1) % imageArrays.count
        layerView.setImage(imageArrays[index!], for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
