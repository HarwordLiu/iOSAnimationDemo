//
//  ViewController.swift
//  AnimationDemo
//
//  Created by 刘浩 on 2017/4/19.
//  Copyright © 2017年 刘浩. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource , UITableViewDelegate {

    let tableView = UITableView(frame: UIScreen.main.bounds, style: .grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = UIColor.white
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "HLCell")
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "HLHeaderView")
        
        title = "iOS核心动画高级技巧"
        view.addSubview(tableView)
        view.backgroundColor = UIColor.white
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HLConstant.shared.classRow[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return HLConstant.shared.classSection.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HLHeaderView")
        header?.textLabel?.text = HLConstant.shared.classSection[section]
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HLCell")!
            cell.textLabel?.text = HLConstant.shared.classRow[indexPath.section][indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nameSpace = Bundle.main.infoDictionary?["CFBundleExecutable"] as! String
        let controllerClass: AnyClass = NSClassFromString(nameSpace + "." + HLConstant.shared.classRow[indexPath.section][indexPath.row])!
        let realClass = controllerClass as! UIViewController.Type
        let animationVC = realClass.init()
        animationVC.title = HLConstant.shared.classRow[indexPath.section][indexPath.row].replacingOccurrences(of: "ViewController", with: "")
        title = HLConstant.shared.classSection[indexPath.section]
        navigationController?.pushViewController(animationVC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        title = "iOS核心动画高级技巧"
    }

}

