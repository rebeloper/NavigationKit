//
//  AsIsDismissToRootLink.swift
//  
//
//  Created by Alex Nagy on 26.12.2020.
//

import SwiftUI

@available(iOS 13.0, *)
public struct AsIsDismissToRootLink<Content: View>: View {
    public let content: Content

    @Environment(\.rootNavigation) var rootNavigation

    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    public var body: some View {
        content.onTapGesture {
            rootNavigation?.wrappedValue.dismiss()
        }
    }
}
