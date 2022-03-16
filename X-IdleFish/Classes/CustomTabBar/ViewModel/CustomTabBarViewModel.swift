//
//  CustomTabBarViewModel.swift
//  X-IdleFish
//
//  Created by 夏能啟 on 3/15/22.
//

import SwiftUI

class CustomTabBarViewModel: ObservableObject {
    
    // 使用atFront来表示当前在顶层View上
    @Published var atFront: Bool = true
}
