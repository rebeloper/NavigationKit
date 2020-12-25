//
//  ButtonDismissNavigationViewLink.swift
//  
//
//  Created by Alex Nagy on 25.12.2020.
//

import SwiftUI

@available(iOS 13.0, *)
public struct ButtonDismissNavigationViewLink<Content: View>: View {
    public let content: Content

    @Environment(\.showingSheet) var showingSheet

    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    public var body: some View {
        Button(action: {
            showingSheet?.wrappedValue = false
        }, label: {
            content
        })
    }
}
