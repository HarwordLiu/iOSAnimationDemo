//
//  CustomTransitionsViewController.swift
//  AnimationDemo
//
//  Created by 刘浩 on 2017/4/19.
//  Copyright © 2017年 刘浩. All rights reserved.
//

import UIKit

// 自定义转场动画（其实就是截图大法）
class CustomTransitionsViewController: HLBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addLayerView()
        // Do any additional setup after loading the view.
    }
    
    override func tapLayerView(_ sender: UIButton) {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, true, 0.0)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        
        let coverImage = UIGraphicsGetImageFromCurrentImageContext()
        
        let coverView = UIImageView(frame: view.bounds)
        coverView.image = coverImage
        view.addSubview(coverView)
        
        view.backgroundColor = UIColor.randomColor
        
        
        UIView.animate(withDuration: 2.0, animations: { 
            let rotate = CGAffineTransform(rotationAngle: CGFloat(Double.pi / 2))
            let transform = rotate.scaledBy(x: 0.01, y: 0.01)
            coverView.transform = transform
            coverView.alpha = 0.0
        }) { (finished) in
            coverView.removeFromSuperview()
        }
        
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
