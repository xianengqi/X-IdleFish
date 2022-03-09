//
//  HomeSearcHotKeywordView.swift
//  X-IdleFish
//
//  Created by 夏能啟 on 3/9/22.
//

import SwiftUI

struct HomeSearcHotKeywordView: View {
    
    // 一个定时器， 每2秒触发一次
    private let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    
    private let ITEM_HEIGHT: CGFloat = 40
    
    @State private var currentIndex: Int = 1
    
    // 这里的数据后期应该是一个模型数组， 通过网络请求， 在整体界面基本完成后，会加入网络请求， 让数据更真实
    private let hotKeywords: [String] = ["烧饼", "馒头", "热干面", "小笼包", "汤面🍜"]
    
    // 接下来实现无缝的轮播， 准备一个新的数组
    private var loopHotKeyWords: [String] {
        return [hotKeywords.last!] + hotKeywords + [hotKeywords.first!]
    }
    
    var body: some View {
        
        let currentOffsetY = CGFloat(currentIndex) * ITEM_HEIGHT
        
        GeometryReader { proxy in
            VStack(alignment: .leading, spacing: 0) {
                ForEach(loopHotKeyWords, id: \.self) { hotKeyword in
                    Text(hotKeyword)
                        .foregroundColor(Color.black.opacity(0.5))
                        .font(.system(size: 14, weight: .bold))
                        .frame(height: ITEM_HEIGHT)
                }
            }
        }
        .frame(height: ITEM_HEIGHT, alignment: .top)
        .frame(maxWidth: .infinity)
        .offset(x: 0, y: -currentOffsetY)
        .clipped()
        // 定时器触发，执行的内容
        .onReceive(timer) { _ in
            // 添加一个动画效果
            withAnimation(.spring()) {
                // 在这里实现热词滚动,实际上就是计算当前要显示的热词index，然后利用index计算出y轴偏移量
                if currentIndex == loopHotKeyWords.count - 1 {
                    currentIndex = 0
                } else {
                    currentIndex += 1
                }
            }
        }
        // onChange监听currentIndex的变化,在这里对currentIndex进行操作，达到无缝轮播的目的
        .onChange(of: currentIndex) { newValue in
            if newValue == 0 {
                currentIndex = loopHotKeyWords.count - 2
            } else if newValue == loopHotKeyWords.count - 1 {
                currentIndex = 1
            }
        }
    }
}

struct HomeSearcHotKeywordView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
