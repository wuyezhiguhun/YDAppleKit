//
//  YDSwiftSingletonController.swift
//  YDKit
//
//  Created by rowena on 2018/8/1.
//  Copyright © 2018年 王允顶. All rights reserved.
//

import UIKit

class YDSwiftSingletonController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.orange
        self.navigationItem.title = "单例模式"
        let singleton1 = YDSingletonPattern.sharedInstance()
        let singleton2 = YDSingletonPattern.sharedInstance()
        let singleton3 = YDSingletonPattern.sharedInstance()
        
        NSLog("YDSingletonPattern --*singleton1*-- %@", singleton1)
        NSLog("YDSingletonPattern --*singleton2*-- %@", singleton2)
        NSLog("YDSingletonPattern --*singleton3*-- %@", singleton3)
        
        
        // Do any additional setup after loading the view.
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
