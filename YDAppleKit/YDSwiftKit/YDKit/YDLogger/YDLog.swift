//
//  YDLog.swift
//  YDAppleKit
//
//  Created by rowena on 2018/11/5.
//  Copyright © 2018年 wuyezhiguhun. All rights reserved.
//

import UIKit

public enum YDLogLevel: Int {
    case i = 1
    case r
    case d
    case w
    case e
    case n

    var name: String {
        switch self {
        case .i:
            return " [-💙-] "
        case .r:
            return " [-💜-] "
        case .d:
            return " [-💚-] "
        case .w:
            return " [-💛-] "
        case .e:
            return " [-❤️-] "
        case .n:
            return " [-🖤-] "
        }
    }
}


class YDLog: NSObject {

    public static let shared = YDLog()
    
    // MARK: - Output
    public var tag: String?
    public var level: YDLogLevel = .n
    public var showThread: Bool = false
    
    
    lazy var dateFormater: DateFormatter = {
       let formater = DateFormatter()
        formater.dateFormat = "yyyy-MM-dd HH:mm:ss.sss"
        return formater
    }()
    
}


//MARK: --- 打印 带有标记的 打印
extension YDLog {
    
    public func i(_ tag: String, _ message: String) {
        log(tag, .i, message: message, currentTime: Date())
    }
    public func r(_ tag: String, _ message: String) {
        #if DEBUG
        #else
        log(tag, .r, message: message, currentTime: Date())
        #endif
    }
    public func d(_ tag: String, _ message: String) {
        #if DEBUG
        log(tag, .d, message: message, currentTime: Date())
        #else
        #endif
    }
    public func w(_ tag: String, _ message: String) {
        log(tag, .w, message: message, currentTime: Date())
    }
    public func e(_ tag: String, _ message: String) {
        log(tag, .e, message: message, currentTime: Date())
    }
    
    private func log(_ tag: String, _ level: YDLogLevel, message: String, currentTime: Date) {
        
        let text = level.name + self.dateFormater.string(from: currentTime) + " : " + tag + " : " +  message
        
        print(text)
    }
}


//MARK: --- 打印
extension YDLog {
    public func i(_ message: String) {
        log(.i, message: message, currentTime: Date())
    }
    public func r(_ message: String) {
        #if DEBUG
        #else
        log(.r, message: message, currentTime: Date())
        #endif
    }
    public func d(_ message: String) {
        #if DEBUG_ASSERT_COMPONENT_NAME_STRING
        log(.r, message: message, currentTime: Date())
        #else
        #endif
    }
    public func w(_ message: String) {
        log(.w, message: message, currentTime: Date())
    }
    public func e(_ message: String) {
        log(.e, message: message, currentTime: Date())
    }
    
    private func log(_ level: YDLogLevel, message: String, currentTime: Date) {
        
        let text = level.name + self.dateFormater.string(from: currentTime) + " : " +  message
        
        print(text)
    }
}
