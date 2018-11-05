//
//  YDLogController.swift
//  YDAppleKit
//
//  Created by rowena on 2018/11/5.
//  Copyright © 2018年 wuyezhiguhun. All rights reserved.
//

import UIKit

class YDLogController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setBaseParameter()
        
        YDLog.shared.i("打印之I")
        YDLog.shared.d("打印之D")
        YDLog.shared.w("打印之W")
        YDLog.shared.e("打印之E")
        
        YDLog.shared.i("info", "打印之I")
        YDLog.shared.d("debug", "打印之D")
        YDLog.shared.w("warning", "打印之W")
        YDLog.shared.e("error", "打印之E")
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension YDLogController {
    
    func setBaseParameter() {
        self.navigationItem.title = "YDLog打印"
        self.view.backgroundColor = UIColor.white
        self.addNavigationBack()
    }
    
}
