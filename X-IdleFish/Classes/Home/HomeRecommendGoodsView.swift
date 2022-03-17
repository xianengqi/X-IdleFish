//
//  HomeRecommendGoodsView.swift
//  X-IdleFish
//
//  Created by 夏能啟 on 3/17/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeRecommendGoodsView: View {
    
    @EnvironmentObject var homeVM: HomeViewModel
    
    var body: some View {
        VStack {
            HomeRecommendView()
            
            
        }
        .frame(width: SCREEN_WIDTH)
    }
}

struct HomeRecommendGoodsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
