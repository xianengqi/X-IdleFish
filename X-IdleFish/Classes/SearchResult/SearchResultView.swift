//
//  SearchResultView.swift
//  X-IdleFish
//
//  Created by 夏能啟 on 3/15/22.
//

import SwiftUI

struct SearchResultView: View {
    
    // 要pop到上一个view， 需要借助系统的一个属性
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        // 应用一般都会自定义导航的返回
        VStack {
            Text("搜索页面")
        }
        // 先隐藏系统的back返回
        .navigationBarBackButtonHidden(true)
        // 再添加自定义的
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarLeading) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("返回")
                }

            }
        }
    }
}

struct SearchResultView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultView()
    }
}
