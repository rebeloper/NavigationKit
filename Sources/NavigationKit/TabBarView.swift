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
    
    @Environment(\.pushingInRoot) public var pushingInRoot
    @Binding public var isActive: Bool
    
    public init(rootView: @escaping () -> RootView, tabItemView: @escaping () -> TabItemView, tabTag: Int, isActive: Binding<Bool>) {
        self.rootView = rootView
        self.tabItemView = tabItemView
        self.tabTag = tabTag
        self._isActive = isActive
    }
    
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
