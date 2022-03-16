//
//  HomeViewModel.swift
//  X-IdleFish
//
//  Created by 夏能啟 on 3/7/22.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    // 修改应用启动后显示的tab页面为推荐
    @Published var currHomeNavTab: HomeNavTab = .rocommend
    
    // 记录当前选择的商品分类标签
    @Published var currGoodsCategoryTab: HomeRecommendGoodsCateoryModel = HOME_GOODS_CATEGORY_TABS[0]
}
