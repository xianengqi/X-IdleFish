//
//  HomeRecommendQuickIntoView.swift
//  X-IdleFish
//
//  Created by 夏能啟 on 3/16/22.
//

import SwiftUI

struct HomeRecommendQuickIntoView: View {
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 3), spacing: 20) {
            ForEach(HOME_RECOMMEND_QUICKINTO_MODELS, id: \.self) { model in
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(model.title)
                            .lineLimit(1)
                            .fixedSize()
                            .font(.system(size: 14, weight: .semibold))
                        Text(model.subTitle)
                            .lineLimit(1)
                            .fixedSize()
                            .font(.system(size: 12))
                            .foregroundColor(Color(hex: model.subTitleColor))
                    }
                    
                    Spacer()
                    
                    Image(model.iconName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 30)
                }
                .padding(.horizontal, 10)
            }
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 12)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(hex: 0xFAFAFA))
        )
    }
}

struct HomeRecommendQuickIntoView_Previews: PreviewProvider {
    static var previews: some View {
        HomeRecommendQuickIntoView()
    }
}
