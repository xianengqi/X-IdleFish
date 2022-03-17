//
//  HomeRecommendView.swift
//  X-IdleFish
//
//  Created by 夏能啟 on 3/16/22.
//

import SwiftUI

struct HomeRecommendView: View {
    
    @StateObject var homeVM: HomeViewModel = HomeViewModel()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                VStack(spacing: 10) {
                    // 闲鱼优品
                    HomeRecommendQualityView()
                    // 功能快捷入口
                    HomeRecommendQuickIntoView()
                }
                .padding(.horizontal, 16)
                
                // 推荐页中的二手商品分类滚动列表
                HomeRecommendGoodsCategoryTabView()
                
                // 推荐页中商品分类对应的商品列表
                HomeRecommendGoodsListView()
            }
        }
    }
}

struct HomeRecommendView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}




