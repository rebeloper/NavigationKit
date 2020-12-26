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
    public var tabTag: Int
    
    @Environment(\.pushingInRoot) var pushingInRoot
    @Binding var isActive: Bool
    
//    public init(rootView: @escaping () -> RootView, tabItemView: @escaping () -> TabItemView, tabTag: Int) {
//        self.rootView = rootView
//        self.tabItemView = tabItemView
//        self.tabTag = tabTag
//    }
    
    public var body: some View {
        NavigationView {
            rootView()
        }
        .tabItem {
            tabItemView()
        }
        .tag(tabTag)
        .environment(\.pushingInRoot, $isActive)
    }
}
