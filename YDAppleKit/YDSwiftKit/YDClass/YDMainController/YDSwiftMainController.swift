//
//  YDMainController.swift
//  YDKit
//
//  Created by 王允顶 on 2018/7/31.
//  Copyright © 2018年 王允顶. All rights reserved.
//

import UIKit

@objc class YDSwiftMainController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Swift知识点"
        self.view.backgroundColor = UIColor.white
        self.addAllViews()
        self.setAllViewsLayout()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    lazy var tableView: UITableView = {
        let table = UITableView(frame: self.view.bounds, style: UITableView.Style.plain)
        table.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "UITableViewCell")
        table.separatorStyle = UITableViewCell.SeparatorStyle.none
        table.backgroundColor = UIColor.clear
        table.delegate = self
        table.dataSource = self
        
        return table
    }()
    lazy var titleList: [String] = {
        let list = ["单例模式", "构建者模式SQL","YDLog打印"]
        return list
    }()
    lazy var controllerList: [String] = {
        let list = [YDModuleRouterSwiftSingletonUrl, YDModuleRouterSwiftBuilderSQLUrl, YDModuleRouterSwiftLogUrl]
        return list
    }()
    lazy var backImageView: UIImageView = {
        let imageView = UIImageView(frame: UIScreen.main.bounds)
        imageView.image = UIImage(named: "swift_back")
        return imageView
    }()
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

//MARK: - 添加所以的view
extension YDSwiftMainController {
    func addAllViews() {
        self.view.addSubview(self.backImageView)
        self.view.addSubview(self.tableView)
    }
}

//MARK: - 自动布局
extension YDSwiftMainController {
    func setAllViewsLayout() {
        self.setTableViewLayout()
    }
    func setTableViewLayout() {
        
    }
}

//MARK: - UITableViewDataSource
extension YDSwiftMainController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titleList.count;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell")!
        cell.textLabel?.text = self.titleList[indexPath.row]
        cell.textLabel?.textAlignment = NSTextAlignment.center
        cell.textLabel?.textColor = UIColor.red
        cell.backgroundColor = UIColor.clear
        return cell
    }
}

//MARK: - UITableViewDelegate
extension YDSwiftMainController {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let controllerUrl = self.controllerList[indexPath.row]
        let controller: UIViewController = YDRouter.shared().match(controllerUrl)
        self.navigationController?.pushViewController(controller, animated: true)
    }
}













