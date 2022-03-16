//
//  Date+Extension.swift
//  IdleFish
//
//  Created by Ben on 2022/1/2.
//

import Foundation

extension Date {
     
    
    /// 格式化时间戳
    /// - Parameters:
    ///   - timeInt: 毫秒级int整数
    ///   - format: 格式
    /// - Returns: 返回格式化后的时间字符串
    static func str(timeInt: Int, format: String) -> String {
        
        let date = Date(timeIntervalSince1970: Double(timeInt) * 0.001)
        
        let formatter = DateFormatter()
        formatter.dateFormat = format
        
        let dateStr = formatter.string(from: date)
        return dateStr
    }
}
