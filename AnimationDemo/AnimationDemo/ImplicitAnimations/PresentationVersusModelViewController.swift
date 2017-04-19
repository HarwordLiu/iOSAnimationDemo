//
//  PresentationVersusModelViewController.swift
//  AnimationDemo
//
//  Created by 刘浩 on 2017/4/19.
//  Copyright © 2017年 刘浩. All rights reserved.
//

import UIKit

class PresentationVersusModelViewController: HLBaseViewController {

    let colorLayer = CALayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
        // Do any additional setup after loading the view.
    }
    
    func configuration() {
        colorLayer.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        colorLayer.position = view.center
        colorLayer.backgroundColor = UIColor.randomColor.cgColor
        view.layer.addSublayer(colorLayer)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let point = touches.first?.location(in: view)
        let convertPoint = view.layer.convert(point!, to: colorLayer)
        if colorLayer.contains(convertPoint) {
            colorLayer.backgroundColor = UIColor.randomColor.cgColor
        } else {
            colorLayer.position = point!
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
