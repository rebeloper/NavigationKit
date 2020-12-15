//
//  TabBarView.swift
//  
//
//  Created by Alex Nagy on 15.12.2020.
//

import SwiftUI

@available(iOS 13.0, *)
struct TabBarView<RootView: View, TabItemView: View>: View {
    
    var rootView: () -> RootView
    var tabItemView: () -> TabItemView
    var navigation: Navigation = Navigation()
    var tabTag: Int
    
    var body: some View {
        NavigationView {
            rootView()
        }
        .tabItem {
            tabItemView()
        }.tag(tabTag).rootable(navigation)
    }
}
