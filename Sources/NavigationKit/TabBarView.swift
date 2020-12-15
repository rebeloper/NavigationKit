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
    
    public var body: some View {
        NavigationView {
            rootView()
        }
        .tabItem {
            tabItemView()
        }.tag(tabTag).rootable(navigation)
    }
}
