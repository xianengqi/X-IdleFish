//
//  HomeView.swift
//  X-IdleFish
//
//  Created by 夏能啟 on 3/6/22.
//

import SwiftUI

struct HomeView: View {
    

    @EnvironmentObject var customTabbarVM: CustomTabBarViewModel
    @StateObject var locationManager = LocationManager()
    @StateObject var homeVM: HomeViewModel = HomeViewModel()

    var body: some View {
        
        // 自定义导航栏
        NavigationView {
            GeometryReader { proxy in
                VStack {
                    HomeNavView()
                        .environmentObject(locationManager)
                        .frame(maxWidth: .infinity)
                        .environmentObject(homeVM)
                    
                    // 在这里添加标签对应的View
                    ScrollView(.horizontal, showsIndicators: false) {
                        TabView(selection: $homeVM.currHomeNavTab) {
                            
                            Color.orange
                                .tag(HomeNavTab.attention)
                                
                            HomeRecommendView()
                                .tag(HomeNavTab.rocommend)
                                .environmentObject(homeVM)
                               
                            Color.red
                                .tag(HomeNavTab.location)
                                
                        }
                        .frame(width: proxy.size.width)
                        // 指定为分页样式， 并且不显示分页显示器
                        .tabViewStyle(.page(indexDisplayMode: .never))
                    }
                    .frame(maxHeight: .infinity, alignment: .top)
                    .onAppear {
                        locationManager.manager.requestLocation()
                        
                        // 当界面重新返回到顶部View时候，需要重新显示tabbar
                        customTabbarVM.atFront.toggle()
                    }
                }
            }
            //  NavigationView 默认会在头部添加NavBar
            // 隐藏navBar
            // 通常一个应用从rootViewCOntroller push到子页面的时候，会隐藏底部的tabbar
            .navigationBarHidden(true)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


