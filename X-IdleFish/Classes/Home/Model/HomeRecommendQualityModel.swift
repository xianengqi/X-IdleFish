//
//  HomeRecommendQualityModel.swift
//  X-IdleFish
//
//  Created by 夏能啟 on 3/16/22.
//

import SwiftUI

let HOME_RECOMMEND_QUALITY_MODELS: [HomeRecommendQualityModel] = [
    HomeRecommendQualityModel.init(title: "精品手机", subTitle: "一年质保", iconName: "home_re_category_phone"),
    HomeRecommendQualityModel.init(title: "奢品捡漏", subTitle: "低价保真", iconName: "home_re_category_baobao"),
    HomeRecommendQualityModel.init(title: "潮鞋潮服", subTitle: "正品尖货", iconName: "home_re_category_jacket"),
    HomeRecommendQualityModel.init(title: "折扣美妆", subTitle: "低至9.9", iconName: "home_re_category_meizhuang"),
]

struct HomeRecommendQualityModel: Codable, Hashable {
    var id = UUID().uuidString
    
    var title: String
    var subTitle: String
    var iconName: String
}

