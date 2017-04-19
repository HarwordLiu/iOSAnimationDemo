//
//  HLBaseViewController.swift
//  PopInstance
//
//  Created by 刘浩 on 2017/4/18.
//  Copyright © 2017年 刘浩. All rights reserved.
//

import UIKit

class HLBaseViewController: UIViewController {
    
    let layerView = UIButton(type: .custom)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
    }
    
    func addLayerView() {
        layerView.frame = CGRect(x: 50, y: 200, width: 200, height: 200)
        layerView.backgroundColor = UIColor.randomColor
        layerView.addTarget(self, action: #selector(tapLayerView(_:)), for: .touchUpInside)
        view.addSubview(layerView)
    }
    func tapLayerView(_ sender: UIButton) {
        
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
