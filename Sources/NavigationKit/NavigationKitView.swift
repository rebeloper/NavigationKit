//
//  NavigationKitView.swift
//  
//
//  Created by Alex Nagy on 13.02.2021.
//

import SwiftUI

public struct NavigationKitView<Content: View>: View {
    @Binding private var isActive : Bool
    private let content: () -> Content
    
    public init(isActive: Binding<Bool>, content: @escaping () -> Content) {
        self._isActive = isActive
        self.content = content
    }
    
    public var body: some View {
        NavigationView {
            content()
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .environment(\.rootPresentationMode, $isActive)
    }
}
