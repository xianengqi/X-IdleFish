//
//  HomeViewModel.swift
//  X-IdleFish
//
//  Created by 夏能啟 on 3/7/22.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var currHomeNavTab: HomeNavTab = .attention
}
