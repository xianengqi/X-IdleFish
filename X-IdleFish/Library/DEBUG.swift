//
//  DEBUG.swift
//  X-IdleFish
//
//  Created by 夏能啟 on 3/7/22.
//

import Foundation

public func Dlog<T>(_ message: T, fileName: String = #file, methodName: String =  #function, lineNumber: Int = #line)
{
    #if DEBUG
    
    let str = (fileName as NSString).pathComponents.last!.replacingOccurrences(of: "swift", with: "")
    print(">>> \(str)\(methodName)[\(lineNumber)]: \(message)")
    #endif
}
