//
//  LayerTimeViewController.swift
//  AnimationDemo
//
//  Created by 刘浩 on 2017/4/20.
//  Copyright © 2017年 刘浩. All rights reserved.
//

import UIKit

class LayerTimeViewController: HLBaseViewController {
    @IBOutlet weak var durationSilder: UISlider!
    @IBOutlet weak var repeatCountSlider: UISlider!
    @IBOutlet weak var timeOffsetSlider: UISlider!
    @IBOutlet weak var speedSlider: UISlider!

    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var repeatCountLabel: UILabel!
    @IBOutlet weak var timeOffsetLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    @IBOutlet weak var containerView: UIView!
    
    let bezierPath = UIBezierPath()
    let pathLayer = CAShapeLayer()
    let shipLayer = CALayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
    }
    
    func configuration() {
        containerView.backgroundColor = UIColor.randomColor
        
        bezierPath.move(to: CGPoint(x: 0, y: 150))
        bezierPath.addCurve(to: CGPoint(x: 300, y: 150), controlPoint1: CGPoint(x: 75, y: 0), controlPoint2: CGPoint(x: 225, y: 300))
        
        pathLayer.path = bezierPath.cgPath
        pathLayer.fillColor = UIColor.randomColor.cgColor
        pathLayer.strokeColor = UIColor.randomColor.cgColor
        pathLayer.lineWidth = 3.0
        containerView.layer.addSublayer(pathLayer)
        
        shipLayer.frame = CGRect(x: 0, y: 0, width: 64, height: 64)
        shipLayer.position = CGPoint(x: 0, y: 150)
        shipLayer.contents = UIImage(named: "plane")?.cgImage
        containerView.layer.addSublayer(shipLayer)
        
        updateSliders()
    }
    
    func updateSliders() {
        durationLabel.text = String(format: "%.2f", durationSilder.value)
        repeatCountLabel.text = String(format: "%.2f", repeatCountSlider.value)
        timeOffsetLabel.text = String(format: "%.2f", timeOffsetSlider.value)
        speedLabel.text = String(format: "%.2f", speedSlider.value)
    }
    
    @IBAction func durationSilder(_ sender: UISlider) {
        durationLabel.text = String(format: "%.2f", sender.value)
    }
    
    @IBAction func repeatCountSilder(_ sender: UISlider) {
        repeatCountLabel.text = String(format: "%.2f", sender.value)
    }
    
    @IBAction func timeOffsetSlider(_ sender: UISlider) {
        timeOffsetLabel.text = String(format: "%.2f", sender.value)
    }
    
    @IBAction func speedSlider(_ sender: UISlider) {
        speedLabel.text = String(format: "%.2f", sender.value)
    }
    
    @IBAction func playBtn(_ sender: UIButton) {
        shipLayer.removeAllAnimations()
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position"
        animation.timeOffset = CFTimeInterval(timeOffsetSlider.value)
        animation.speed = speedSlider.value
        animation.duration = CFTimeInterval(durationSilder.value)
        animation.repeatCount = repeatCountSlider.value
        animation.path = bezierPath.cgPath
        animation.rotationMode = kCAAnimationRotateAuto
        shipLayer.add(animation, forKey: "slide")
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
