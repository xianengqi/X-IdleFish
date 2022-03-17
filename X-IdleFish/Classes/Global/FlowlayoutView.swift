//
//  FlowlayoutView.swift
//  X-IdleFish
//
//  Created by 夏能啟 on 3/17/22.
//

import SwiftUI

struct FlowLayoutView<Content: View, T: Identifiable>: View where T: Hashable {
    
    // 数据源，一个泛型模型组
    var list: [T]
    
    
    // 这里定义一个content, 后面会暴露在init方法中，用来自定义网格的每个item的布局
    var content: (T) -> Content
    
    // 指定网格中的列数
    var colums: Int
    
    // 用来控制item横向间距
    var itemSpacingH: CGFloat
    // 用来控制item 纵向间距
    var itemSpacingV: CGFloat
    
    // 声明一个方法， 用来对数据源重新组合，以符合当前结构使用
    private func splistList() -> [[T]] {
        
        var currIndex: Int = 0
        
        // 声明一个数组，该数组有colums个元素，每个元素的类型为[T]
        var gridList: [[T]] = Array(repeating: [], count: colums)
        
        list.forEach { obj in
            gridList[currIndex].append(obj)
            if currIndex == colums - 1 {
                currIndex = 0
            } else {
                currIndex += 1
            }
        }
        return gridList
    }
    
    init(list: [T], colums: Int, itemSpacingH: CGFloat = 10, itemSpacingV: CGFloat = 10, @ViewBuilder content: @escaping (T) -> Content) {
        self.list = list
        self.colums = colums
        self.content = content
        self.itemSpacingH = itemSpacingH
        self.itemSpacingV = itemSpacingV
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            HStack(alignment: .top, spacing: itemSpacingH) {
                ForEach(splistList(), id: \.self) { objs in
                    LazyVStack(spacing: itemSpacingV) {
                        ForEach(objs) { obj in
                            content(obj)
                        }
                    }
                }
            }
        }
    }
}
