//
//  HomeGoodsCardView.swift
//  X-IdleFish
//
//  Created by 夏能啟 on 3/17/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeGoodsCardView: View {
    
    var goodsCardModel: GoodsCardModel
    
    var body: some View {
        WebImage(url: URL(string: goodsCardModel.goodsInfo?.images?.first ?? ""))
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(10)
        
        VStack(alignment: .leading, spacing: 5) {
            Text(goodsCardModel.goodsInfo?.name ?? "")
                .font(.system(size: 14, weight: .semibold))
            
            HStack {
                 
                (Text("¥")
                    .font(.system(size: 14, weight: .semibold))
                +
                Text(goodsCardModel.goodsPriceStr)
                    .font(.system(size: 12, weight: .semibold)))
                .foregroundColor(Color(hex: 0xFA4B4E))
                
                Spacer()
                
                Text("\(goodsCardModel.wantBuyCount)人想要")
                    .font(.system(size: 10))
                    .foregroundColor(Color.black.opacity(0.5))
            }
            
            HStack {
                WebImage(url: URL(string: goodsCardModel.seller?.avatar ?? ""))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                
                Text(goodsCardModel.seller?.nick_name ?? "")
                    .lineLimit(1)
                    .font(.system(size: 10))
                    .foregroundColor(Color.black.opacity(0.5))
                
                Spacer()
                
                Image("goodscard_seller_zhima_good")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 20)
            }
        }
    }
}

struct HomeGoodsCardView_Previews: PreviewProvider {
    static var previews: some View {
        
        HomeRecommendGoodsListView()
    }
}
