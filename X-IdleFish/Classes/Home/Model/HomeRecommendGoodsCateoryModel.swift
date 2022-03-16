//
//  HomeRecommendGoodsCateoryModel.swift
//  X-IdleFish
//
//  Created by 夏能啟 on 3/16/22.
//

import SwiftUI

let HOME_GOODS_CATEGORY_TABS: [HomeRecommendGoodsCateoryModel] = [
    HomeRecommendGoodsCateoryModel.init(id: 0, title: "猜你喜欢"),
    HomeRecommendGoodsCateoryModel.init(id: 1, title: "电脑组装"),
    HomeRecommendGoodsCateoryModel.init(id: 2, title: "钢琴"),
    HomeRecommendGoodsCateoryModel.init(id: 3, title: "手机"),
    HomeRecommendGoodsCateoryModel.init(id: 4, title: "平板"),
    HomeRecommendGoodsCateoryModel.init(id: 5, title: "猫咪"),
    HomeRecommendGoodsCateoryModel.init(id: 6, title: "智能装备"),
    HomeRecommendGoodsCateoryModel.init(id: 7, title: "台球"),
    HomeRecommendGoodsCateoryModel.init(id: 8, title: "狗狗"),
    HomeRecommendGoodsCateoryModel.init(id: 9, title: "汽车"),
    HomeRecommendGoodsCateoryModel.init(id: 10, title: "仓鼠"),
    HomeRecommendGoodsCateoryModel.init(id: 11, title: "机车"),
    HomeRecommendGoodsCateoryModel.init(id: 12, title: "摄影"),
    HomeRecommendGoodsCateoryModel.init(id: 13, title: "羽毛球"),
    HomeRecommendGoodsCateoryModel.init(id: 14, title: "橄榄球"),
    HomeRecommendGoodsCateoryModel.init(id: 15, title: "水族世界"),
]

struct HomeRecommendGoodsCateoryModel: Codable,Hashable {
    var id: Int
    var title: String
}

