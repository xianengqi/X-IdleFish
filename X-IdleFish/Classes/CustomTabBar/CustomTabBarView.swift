//
//  CustomTabBarView.swift
//  X-IdleFish
//
//  Created by 夏能啟 on 3/5/22.
//

import SwiftUI
// 导入SW
import SDWebImageSwiftUI

// 自定义tabBar的enum
enum CustomTabBar: String, CaseIterable {
    case home               = "闲鱼"
    case niceplay           = "会玩"
    case message            = "消息"
    case mine               = "我的"
    
    // TabBarItem的图标名称
    var iconName: String {
        switch self {
        case .home:
            return "tabbar_home"
        case .niceplay:
            return "tabbar_niceplay"
        case .message:
            return "tabbar_message"
        case .mine:
            return "tabbar_mine"
        }
    }
    
    // 默认图标
    var norIconName: String {
        return iconName + "_nor"
    }
    
    // 选中图标
    var selIconName: String {
        return iconName + "_sel"
    }
}

struct CustomTabBarView: View {
    
    var safeEdgeInsetes: EdgeInsets
    
    // @Binding 表示当该变量改变时，会通知外部属性，也就是说这个值是由外部传递进来的, 那么在哪里传递呢?
    @Binding var currTab: CustomTabBar
    
    var body: some View {
        
        // 遍历CustomTabBar的子项，实现tabBarItem布局
        
        // Hstack这类容器对内部都有一个默认的间距，不希望使用的话就可以设置为0
        HStack(spacing: 0) {
            ForEach(CustomTabBar.allCases, id: \.rawValue) { item in
                
                // 自定义的tabBarItem需要可以点击
                Button {
                    currTab = item
                } label: {
                    VStack {
                        // 闲鱼应用的tabbar在切换之后，会有一个动图播放的效果，这里也简单实现一下，由于没有找到相似的资源，我仅使用一个示例gif代替
                        // 要实现动图效果，就需要借助SDWebImageSwiftUI来实现， 现在添加这个库
                        if currTab == item {
                            // 调整gif图的大小
                            AnimatedImage(name: "tabbar_animation.gif")
                            // 切换gif动画只会播放一次
                                .customLoopCount(1)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 35, height: 35)
                           
                            
                        } else {
                            Image(item.norIconName)
                        }
                        
                        
                        
                        Text(item.rawValue)
                        // 设置字体颜色
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(Color.black.opacity(currTab == item ? 0.7 : 0.3))
                    }
                }
                // 让tabBarItem宽度等分
                .frame(maxWidth: .infinity)
                
                // 接下来插入发布闲置的按钮
                if item == .niceplay {
                    Button {
                        
                    } label: {
                        Image("tabbar_post_idle")
                        // 重新指定按钮图片的大小
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 75, height: 75)
                    }
                    // 让发布按钮向上10
                    .offset(y: -10)
                }
            }
        }
        // 再添加一个top的边距
        .padding(.top, 20)
        // 添加边距， .bottom表示添加底部的边距, 考虑到有些机型不需要这个间距，添加一个默认间距
        .padding(.bottom, safeEdgeInsetes.bottom == 0 ? 10 : safeEdgeInsetes.bottom)
        // 接下来修改背景色，实现圆弧效果
        
        // 由于Canvasz只能在SwiftUI3和iOS15使用，下面实现一个低版本的方式
        
        
        .background(Color.white.clipShape(CustomTabBackColorClipShape()))
        
//        .background(
//            // Canvas是SwiftUI引入的新特性，仅支持iOS15版本
//
//
//            Canvas { context, size in
//
//                let width = size.width
//                let height = size.height
//                let midWidth = width * 0.5
//
//                context.fill(Path { path in
//
//                    // 先简单实现一个矩型填充
//
//                    // 接下来利用贝塞尔曲线实现发布闲置按钮的凸起
//                    path.move(to: CGPoint(x: 0, y: 20))
//
//                    path.addLine(to: CGPoint(x: midWidth - 55, y: 20))
//
//                    path.addCurve(to: CGPoint(x: midWidth, y: 1), control1: CGPoint(x: midWidth - 35, y: 20), control2: CGPoint(x: midWidth - 25, y: 0))
//                    path.addCurve(to: CGPoint(x: midWidth + 55, y: 20), control1: CGPoint(x: midWidth + 25, y: 0), control2: CGPoint(x: midWidth + 35, y: 20))
//
//                    path.addLine(to: CGPoint(x: width, y: 20))
//                    path.addLine(to: CGPoint(x: width, y: height))
//                    path.addLine(to: CGPoint(x: 0, y: height))
//
//                }, with: .color(.white))
//            }
//        )
    }
}

struct CustomTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
      
// 这里可以实现按照指定形状对View进行切割
struct CustomTabBackColorClipShape: Shape {
    func path(in rect: CGRect) -> Path {
        
        let width = rect.size.width
        let height = rect.size.height
        let midWidth = width * 0.5
        
        // 同样是使用贝塞尔曲线实现， 所以可以直接套用上面的path创建
        return Path { path in
            path.move(to: CGPoint(x: 0, y: 20))

            path.addLine(to: CGPoint(x: midWidth - 55, y: 20))

            path.addCurve(to: CGPoint(x: midWidth, y: 1), control1: CGPoint(x: midWidth - 35, y: 20), control2: CGPoint(x: midWidth - 25, y: 0))
            path.addCurve(to: CGPoint(x: midWidth + 55, y: 20), control1: CGPoint(x: midWidth + 25, y: 0), control2: CGPoint(x: midWidth + 35, y: 20))

            path.addLine(to: CGPoint(x: width, y: 20))
            path.addLine(to: CGPoint(x: width, y: height))
            path.addLine(to: CGPoint(x: 0, y: height))
        }
    }
}
