//
//  HomeNavView.swift
//  X-IdleFish
//
//  Created by 夏能啟 on 3/7/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeNavView: View {
    
    // 记录要搜索的关键字
    @State var searchKeyword: String = ""
    
    var body: some View {
        VStack {
            VStack {
                
                // 签到，直播提示和标签卡所在的横向容器
                HStack {
                    
                    // 签到按钮
                    Button {
                        
                    } label: {
                        AnimatedImage(name: "home_sign.gif")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 46, height: 46)
                    }
                    
                    // Spacer的作用是尽可能占用空余的空间
                    Spacer()
                    
                    // 直播提示
                    Button {
                        
                    } label: {
                        ZStack(alignment: .bottom) {
                            Image("miyo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 46, height: 46)
                            // 裁切成圆形
                            .clipShape(Circle())
                            // 添加带颜色的边框
                            .overlay(
                                RoundedRectangle(cornerRadius: 23)
                                    .stroke(Color.red, lineWidth: 4)
                            )
                            // 添加直播中文字提示
                            HStack {
                                Color.white.clipShape(Circle())
                                    .frame(width: 5, height: 5)
                                Text("直播中")
                                    .font(.system(size: 10, weight: .bold))
                                    .foregroundColor(.white)
                            }
                            .background(
                                Capsule().fill(Color.red)
                                    .frame(width: 50, height: 16)
                            )
                        }
                    }
                }
                .overlay(
                    HStack {
                        HomeNavTabBtn(tab: .attention)
                        HomeNavTabBtn(tab: .rocommend)
                        HomeNavTabBtn(tab: .location)
                    }
                )
                // 添加搜索框
                HStack {
                    
                    // 二维码按钮
                    HStack {
                        Button {
                            
                        } label: {
                            Image("home_nav_search_qrcode")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxHeight: .infinity)
                                .padding(4)
                        }
                        // 分割线
                        Divider()
                            .foregroundColor(Color.black.opacity(0.3))
                            .frame(width: 1, height: 20)
                        
                        // 搜索框
                        TextField("", text: $searchKeyword)
                        
                        // 搜索按钮
                        Button {
                            
                        } label: {
                            Text("搜索")
                                .font(.system(size: 14))
                                .foregroundColor(.black.opacity(0.8))
                                .padding(.horizontal, 15)
                                .frame(maxHeight: .infinity)
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(Color.yellow)
                                )
                        }
                    }
                    // 添加内边距，让二维码相对左边有一个4的距离
                    .padding(.leading, 4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.yellow, lineWidth: 2)
                    )
                    
                    // 分类按钮
                    Button {
                        
                    } label: {
                        Image("home_nav_classify")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxHeight: .infinity)
                    }

                }
                .frame(height: 40)
            }
            // 整体添加一个横向内边距
            .padding(.horizontal, 10)
        }
    }
}

struct HomeNavView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


enum HomeNavTab: String {
    case attention      = "关注"
    case rocommend      = "推荐"
    case location       = "北京"
}

struct HomeNavTabBtn: View {
    
    @EnvironmentObject var homeVM: HomeViewModel
    var tab: HomeNavTab
    
    var body: some View {
        Button {
            withAnimation {
                homeVM.currHomeNavTab = tab
            }
        } label: {
            // trailing表示居右对齐
            ZStack(alignment: .trailing) {
                Text(tab.rawValue)
                    .font(.system(size: 16, weight: homeVM.currHomeNavTab == tab ? .bold : .medium))
                    .foregroundColor(Color.black.opacity(homeVM.currHomeNavTab == tab ? 0.7 : 0.3))
                    .padding(.horizontal, 15)
                // 选中的标签， 整体会放大
                    .scaleEffect(homeVM.currHomeNavTab == tab ? 1.3 : 1)
                // 添加定位旁边的箭头
                if tab == .location {
                    Image(systemName: "chevron.down")
                        .font(.system(size: 6))
                        .foregroundColor(Color.black.opacity(0.4))
                        .opacity(homeVM.currHomeNavTab == tab ? 1 : 0)
                }
            }
            .foregroundColor(Color.black.opacity(homeVM.currHomeNavTab == tab ? 0.7 : 0.3))
        }

    }
}
