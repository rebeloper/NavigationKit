//
//  NKView.swift
//  
//
//  Created by Alex Nagy on 13.02.2021.
//

import SwiftUI

public struct NKView<Content: View>: View {
    @Binding private var root : Bool
    private let content: () -> Content
    
    public init(root: Binding<Bool>, content: @escaping () -> Content) {
        self._root = root
        self.content = content
    }
    
    public var body: some View {
        NavigationView {
            content()
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .environment(\.rootPresentationMode, $root)
    }
}
