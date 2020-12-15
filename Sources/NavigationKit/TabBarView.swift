//
//  TabBarView.swift
//  
//
//  Created by Alex Nagy on 15.12.2020.
//

import SwiftUI

@available(iOS 13.0, *)
public struct TabBarView<RootView: View, TabItemView: View>: View {
    
    public var rootView: () -> RootView
    public var tabItemView: () -> TabItemView
    public var navigation: Navigation = Navigation()
    public var tabTag: Int
    
    public init(rootView: @escaping () -> RootView, tabItemView: @escaping () -> TabItemView, navigation: Navigation? = nil, tabTag: Int) {
        self.rootView = rootView
        self.tabItemView = tabItemView
        if let navigation = navigation {
            self.navigation = navigation
        }
        self.tabTag = tabTag
    }
    
    public var body: some View {
        NavigationView {
            rootView()
        }
        .tabItem {
            tabItemView()
        }.tag(tabTag).rootable(navigation)
    }
}
