//
//  HLBaseViewController.swift
//  PopInstance
//
//  Created by 刘浩 on 2017/4/18.
//  Copyright © 2017年 刘浩. All rights reserved.
//

import UIKit

typealias SelectedComplected = (String) -> Void

enum SelectedStatus {
    case Selected, UnSelected
}

class HLBaseViewController: UIViewController {
    
    let layerView = UIButton(type: .custom)
    let runView = UIButton(type: .custom)
    
    var selectStatus = SelectedStatus.UnSelected

    var statusArray: Array<Any>?
    var selectComplected: SelectedComplected?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
    }
    
    func addNavitionBar(status: Array<Any>, selected: @escaping SelectedComplected) {
        let item = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(tapRightBarItem(_:)))
        navigationItem.rightBarButtonItem = item
        statusArray = status
        selectComplected = selected
    }
    
    func addSelectorView(status: Array<Any>, selected: @escaping SelectedComplected) {
        let alertView = UIAlertController()
        for statu in status {
            let alertAction = UIAlertAction(title: String(format: "%@", statu as! CVarArg), style: UIAlertActionStyle.default, handler: {
                selected($0.title!)
            })
            alertView.addAction(alertAction)
        }
        present(alertView, animated: true, completion: nil)
    }
    
    func addLayerView() {
        layerView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        layerView.center = CGPoint(x: UIScreen.main.bounds.size.width / 2, y: UIScreen.main.bounds.size.height / 2)
        layerView.backgroundColor = UIColor.randomColor
        layerView.addTarget(self, action: #selector(tapLayerView(_:)), for: .touchUpInside)
        view.addSubview(layerView)
    }
    
    func addRunView() {
        runView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        runView.center = CGPoint(x: UIScreen.main.bounds.size.width / 4, y: UIScreen.main.bounds.size.height / 2)
        runView.backgroundColor = UIColor.randomColor
        runView.addTarget(self, action: #selector(tapRunView(_:)), for: .touchUpInside)
        view.addSubview(runView)
    }
    
    func tapLayerView(_ sender: UIButton) {
        
    }
    
    func tapRunView(_ sender: UIButton) {
        
    }
    
    func tapRightBarItem(_ sender: UIBarButtonItem) {
        addSelectorView(status: statusArray!, selected: selectComplected!)
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
