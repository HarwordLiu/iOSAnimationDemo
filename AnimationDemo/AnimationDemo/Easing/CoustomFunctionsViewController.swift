//
//  CoustomFunctionsViewController.swift
//  AnimationDemo
//
//  Created by 刘浩 on 2017/4/20.
//  Copyright © 2017年 刘浩. All rights reserved.
//

import UIKit

class CoustomFunctionsViewController: HLBaseViewController {

    @IBOutlet weak var contrainerView: UIButton!
    
    @IBOutlet weak var point1TextField: UITextField!

    @IBOutlet weak var point2TextField: UITextField!
    
    let colorLayer = CALayer()
    
    var shapeLayer = CAShapeLayer()
    
    var selected: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        unowned let weakSelf = self
        addNavitionBar(status: [kCAMediaTimingFunctionLinear,
                                kCAMediaTimingFunctionEaseIn,
                                kCAMediaTimingFunctionEaseOut,
                                kCAMediaTimingFunctionEaseInEaseOut,
                                kCAMediaTimingFunctionDefault]) { (select) in
                                    DispatchQueue.main.async() {
                                        // 返回到主线程更新 UI
                                        weakSelf.addFunctionsBezierPath(named: select)
                                    }
                                    weakSelf.selected = select
        }
        

        
        configuration()
    }
    
    func configuration() {
        
        selected = kCAMediaTimingFunctionDefault
        addFunctionsBezierPath(named: selected!)
        
        colorLayer.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        colorLayer.position = CGPoint(x: 25, y: 150)
        colorLayer.backgroundColor = UIColor.randomColor.cgColor
        contrainerView.layer.addSublayer(colorLayer)
    }
    
    func addFunctionsBezierPath(named: String) {
//        if (contrainerView.layer.sublayers?.contains(shapeLayer))! {
//            shapeLayer.removeFromSuperlayer()
//        }
//
        let timingFunction = CAMediaTimingFunction(name: named)
        
        var point1: [Float] = [0.0,0.0]
        var point2: [Float] = [0.0,0.0]
        
        timingFunction.getControlPoint(at: 1, values: &point1)
        timingFunction.getControlPoint(at: 2, values: &point2)
        
        print("\(String(describing: point1)),\(String(describing: point2))")
        
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint.zero)
        bezierPath.addCurve(to: CGPoint(x: 1, y: 1), controlPoint1: CGPoint(x: Double(point1[0]), y: Double(point1[1])), controlPoint2: CGPoint(x: Double(point2[0]), y: Double(point2[1])))
        bezierPath.apply(CGAffineTransform(scaleX: 300, y: 300))
        
        shapeLayer = CAShapeLayer()
        
        shapeLayer.strokeColor = UIColor.randomColor.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 4.0
        shapeLayer.path = bezierPath.cgPath
        contrainerView.layer.addSublayer(shapeLayer)
        
        contrainerView.layer.isGeometryFlipped = true
    }

    @IBAction func tapContrainerView(_ sender: UIButton) {
        colorLayer.removeAllAnimations()
        
        let animation = CABasicAnimation()
        if selected != nil {
            animation.timingFunction = CAMediaTimingFunction(name: selected!)
        }
        animation.duration = 2.0
        animation.keyPath = "position"
        
        if selectStatus == .Selected {
            animation.toValue = CGPoint(x: 25, y: 150)
            selectStatus = .UnSelected
        } else {
            animation.toValue = CGPoint(x: 275, y: 150)
            selectStatus = .Selected
        }
        
        colorLayer.add(animation, forKey: nil)

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
