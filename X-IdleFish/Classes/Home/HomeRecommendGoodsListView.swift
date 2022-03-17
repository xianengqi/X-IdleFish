//
//  HomeRecommendGoodsListView.swift
//  X-IdleFish
//
//  Created by 夏能啟 on 3/17/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeRecommendGoodsListView: View {
    
    
    var body: some View {
        // 先来分析一下闲鱼首页商品列表的大致结构
        // 先完成里面的网格布局，自定义一个FlowlayoutView
        FlowLayoutView(list: DEFAULT_GOODSCARD_MODELS, colums: 2, itemSpacingV: 30 ) { model in
            
            // 接下来细化每个商品视图
           HomeGoodsCardView(goodsCardModel: model)
        }
        .padding(.bottom, 40)
        .padding(.horizontal, 16)
    }
}

struct HomeRecommendGoodsListView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


