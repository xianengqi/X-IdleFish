//
//  Array+Extension.swift
//  Array+Extension
//
//  Created by Ben on 2021/8/31.
//

import SwiftUI

extension Array where Element: Equatable {
    
    func removeDuplicate() -> Array {
        return self.enumerated().filter { (index,value) -> Bool in
            return self.firstIndex(of: value) == index
        }.map { (_, value) in
            value
        }
    }
    
    func removeObject(obj: Element) -> Array {
        
        return self.filter { $0 != obj }
    }
   
}
