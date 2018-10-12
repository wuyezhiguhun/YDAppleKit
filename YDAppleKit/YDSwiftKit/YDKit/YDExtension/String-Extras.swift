//
//  String-Extras.swift
//  YDKit
//
//  Created by 王允顶 on 2018/8/19.
//  Copyright © 2018年 王允顶. All rights reserved.
//

#if os(iOS)
import UIKit
#else
import AppKit
#endif

extension String {

    func positionOf(sub: String) -> Int {
        var pos = -1
        if let range = range(of: sub) {
            if !range.isEmpty {
                pos = self.distance(from: startIndex, to: range.lowerBound)
//                pos = characters.distance(from: startIndex, to: range.lowerBound)
            }
        }
        return pos
    }
    
    func subString(start: Int, length: Int = -1) -> String {
        var len = length
        if len == -1 {
            len = self.count - start
        }
        let st = self.index(startIndex, offsetBy: start)
        let en = self.index(st, offsetBy: len)
        
        let range = st ..< en
        return substring(with: range)
        
    }
    
    func urlEncoded() -> String {
        let res: NSString = CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, self as NSString, nil, "!*'();:@&=+$,/?%#[]" as CFString, CFStringConvertNSStringEncodingToEncoding(String.Encoding.utf8.rawValue))
        return res as String
    }
    
    func urlDecoded() -> String {
        let res: NSString = CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, self as NSString, nil, "" as CFString, CFStringConvertNSStringEncodingToEncoding(String.Encoding.utf8.rawValue))
        return res as String
    }
    
    func range() -> Range<String.Index> {
        return Range(NSRange(location: 0, length: self.count - 1), in: self)!
    }
    
}
