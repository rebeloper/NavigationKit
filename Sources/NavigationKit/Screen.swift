//
//  Screen.swift
//  
//
//  Created by Alex Nagy on 26.12.2020.
//

import SwiftUI

public struct Screen<Content>: View where Content: View {
    
    public var content: () -> Content
    
    public init(content: @escaping () -> Content) {
        self.content = content
    }

    public var body: some View {
        ZStack {
            Color.clear.edgesIgnoringSafeArea(.all)
            content()
        }
    }
}

public struct AsScreen: ViewModifier {
    public func body(content: Content) -> some View {
        Screen { content }
    }
}

extension View {
    public func asScreen() -> some View {
        modifier(AsScreen())
    }
}
