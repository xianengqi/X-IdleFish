//
//  HomeView.swift
//  X-IdleFish
//
//  Created by 夏能啟 on 3/6/22.
//

import SwiftUI

struct HomeView: View {
    
//    @State var currHomeNavTab: HomeNavTab = .attention
    @StateObject var locationManager = LocationManager()
    @StateObject var homeVM: HomeViewModel = HomeViewModel()

    var body: some View {
        
        // 自定义导航栏
        GeometryReader { proxy in
            VStack {
                HomeNavView()
                    .frame(maxWidth: .infinity)
                    .environmentObject(homeVM)
                
                // 在这里添加标签对应的View
                ScrollView(.horizontal, showsIndicators: false) {
                    TabView(selection: $homeVM.currHomeNavTab) {
                        
                        Color.orange
                            .tag(HomeNavTab.attention)
                            
                        Color.blue
                            .tag(HomeNavTab.rocommend)
                           
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
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


