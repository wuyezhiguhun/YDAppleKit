//
//  YDSingletonPattern.swift
//  YDKit
//
//  Created by 王允顶 on 2018/7/31.
//  Copyright © 2018年 王允顶. All rights reserved.
//

import UIKit

final class YDSwiftSingletonPattern: NSObject {

    private static let instance: YDSwiftSingletonPattern = YDSwiftSingletonPattern()
    class func sharedInstance() -> YDSwiftSingletonPattern {
        return instance
    }
    
    //将构成方法私有化
    private override init() {
        
    }
    
    
    
}
