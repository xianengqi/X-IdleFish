//
//  ContentView.swift
//  X-IdleFish
//
//  Created by 夏能啟 on 3/5/22.
//

import SwiftUI

struct ContentView: View {
    
    // @State 修饰的属性有一个作用，当该属性被修改时会触发重现绘制界面
    @State var currTab: CustomTabBar = .home
    
    var body: some View {
        
        // 首先实现tabBarView
        
        GeometryReader { proxy in
            
            // ZStack 是一个z轴方向叠加view的容器，alignment可以设置容器内的view按照哪个方向叠放
            ZStack(alignment: .bottom) {
                TabView(selection: $currTab) {
                    
                    ForEach(CustomTabBar.allCases, id: \.rawValue) { item in
                        Text(item.rawValue)
                            .tag(item)
                        // 为了方便调试UI,区分界线，添加一些背景色
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.blue)
                    }
                }
                
                // 创建自定义tabBarView， 之所以创建自定义的tabBar是应为闲鱼发布闲置物品按钮有一个凸起的圆弧
                // 刚才的绑定属性就是从这里传递的
                
                // 让CustomTabBarView相对底部有一个间距， 这个距离是Apple定义的安全距离， 如何获取？
                CustomTabBarView(safeEdgeInsetes: proxy.safeAreaInsets, currTab: $currTab)
            }
            // 解决底部的白色部分
            .ignoresSafeArea(.all, edges: .bottom)

        }
        
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
