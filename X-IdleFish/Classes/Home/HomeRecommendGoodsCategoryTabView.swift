//
//  HomeRecommendGoodsCategoryTabView.swift
//  X-IdleFish
//
//  Created by 夏能啟 on 3/16/22.
//

import SwiftUI

struct HomeRecommendGoodsCategoryTabView: View {
    
    @EnvironmentObject var homeVM: HomeViewModel
    @Namespace var animation
    
    var body: some View {
        ZStack(alignment: .trailing) {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: Array(repeating: GridItem(.flexible(), spacing: 0), count: 1), spacing: 20) {
                    
                    ForEach(HOME_GOODS_CATEGORY_TABS, id: \.self) { tab in
                        Button {
                            withAnimation(.spring()) {
                                homeVM.currGoodsCategoryTab = tab
                            }
                        } label: {
                            ZStack(alignment: .bottom) {
                                Text(tab.title)
                                    .font(.system(size: 14))
                                    .foregroundColor(Color.black.opacity(homeVM.currGoodsCategoryTab == tab ? 1 : 0.5))
                                    .frame(maxHeight: .infinity)
                                    .scaleEffect(homeVM.currGoodsCategoryTab == tab ? 1.2 : 1)
                                
                                if homeVM.currGoodsCategoryTab == tab {
                                    Image("home_indicator")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 20)
                                        .matchedGeometryEffect(id: "HOME_RECOMMEND_CATEGORY_ANIMATION", in: animation)
                                } else {
                                    Image("home_indicator")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 20)
                                        .hidden()
                                }
                            }
                        }

                    }
                }
                .frame(height: 40)
                .padding(.leading, 16)
                .padding(.trailing, 60)
                .background(
                    Color.white
                )
            }
            // 添加右侧全部分类按钮, 这个按钮背景色有一个渐变透明的效果
            ZStack(alignment: .trailing) {
                LinearGradient(colors: [Color.white.opacity(0), Color.white, Color.white], startPoint: .leading, endPoint: .trailing)
                Image(systemName: "list.dash")
                    .offset(x: -16)
            }
            // 右侧留有空白
            .frame(width: 76, height: 40)
        }
    }
}

struct HomeRecommendGoodsCategoryTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeRecommendGoodsCategoryTabView()
    }
}
