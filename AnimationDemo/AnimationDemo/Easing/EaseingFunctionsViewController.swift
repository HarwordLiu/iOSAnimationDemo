//
//  EaseingFunctionsViewController.swift
//  AnimationDemo
//
//  Created by 刘浩 on 2017/4/20.
//  Copyright © 2017年 刘浩. All rights reserved.
//

import UIKit

class EaseingFunctionsViewController: HLBaseViewController {

    let colorLayer = CALayer()
    
    var selected: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        unowned let weakSelf = self
        addLayerView()
        addNavitionBar(status: [kCAMediaTimingFunctionLinear,
                                kCAMediaTimingFunctionEaseIn,
                                kCAMediaTimingFunctionEaseOut,
                                kCAMediaTimingFunctionEaseInEaseOut,
                                kCAMediaTimingFunctionDefault]) { (selected) in
                                    weakSelf.selected = selected
                                    weakSelf.title = selected
        }
        
        configuration()
    }
    
    func configuration() {
        colorLayer.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        colorLayer.position = CGPoint(x: 25, y: 150)
        colorLayer.backgroundColor = UIColor.randomColor.cgColor
        layerView.layer.addSublayer(colorLayer)
    }
    
    override func tapLayerView(_ sender: UIButton) {
        CATransaction.begin()
        CATransaction .setAnimationDuration(1.0)
        if selected != nil {
            CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: selected!))
        }
        if selectStatus == .Selected {
            colorLayer.position = CGPoint(x: 25, y: 150)
            selectStatus = .UnSelected
        } else {
            colorLayer.position = CGPoint(x: 275, y: 150)
            selectStatus = .Selected
        }
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
