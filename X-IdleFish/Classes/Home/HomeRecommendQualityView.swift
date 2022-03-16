//
//  HomeRecommendQualityView.swift
//  X-IdleFish
//
//  Created by 夏能啟 on 3/16/22.
//

import SwiftUI

struct HomeRecommendQualityView: View {
    var body: some View {
        VStack {
            
            // 闲鱼优品
            HStack {
                Text("闲鱼优品")
//                    .fixedSize(horizontal: true, vertical: false)
                    .font(.system(size: 18, weight: .semibold))
                
                Text("100%验货包真 ｜ 全国包邮 ｜ 品质包退")
//                    .fixedSize(horizontal: true, vertical: false)
                    .font(.system(size: 12))
                    .padding(4)
                    .background(
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color(hex: 0xF9E5C4))
                    )
                Spacer()
                
                Button {
                    
                } label: {
                    HStack(spacing: 0) {
                        Text("更多")
                        Image(systemName: "chevron.right")
                    }
//                    .fixedSize(horizontal: true, vertical: false)
                    .font(.system(size: 12))
                    .foregroundColor(Color.black.opacity(0.4))
                    .padding(4)
                    .background(
                        Capsule().fill(.white)
                    )
                }
                
            }
            
            // 闲鱼优品的推荐入口
            HStack(spacing: 15) {
                ForEach(HOME_RECOMMEND_QUALITY_MODELS, id: \.self) { model in
                    
                    VStack(spacing: 0) {
                        ZStack {
                            Circle().fill(.white)
                            Image(model.iconName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(18)
                        }
                        
                        Text(model.title)
                            .font(.system(size: 14, weight: .semibold))
                        Text(model.subTitle)
                            .font(.system(size: 12))
                            .foregroundColor(Color.black.opacity(0.5))
                    }
                    
                }
            }
        }
        .padding(8)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(hex: 0xFAFAFA))
        )
    }
}

struct HomeRecommendQualityView_Previews: PreviewProvider {
    static var previews: some View {
        HomeRecommendQualityView()
    }
}
