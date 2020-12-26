//
//  ButtonAsRootNavigationLink.swift
//  
//
//  Created by Alex Nagy on 26.12.2020.
//

import SwiftUI

@available(iOS 13.0, *)
public struct ButtonAsRootNavigationLink<Destination: View, Content: View>: View {
    public let destination: Destination
    public let content: Content

    public var isActive: Binding<Bool>
    @Environment(\.pushingInRoot) var pushingInRoot

    public init(destination: Destination, @ViewBuilder content: () -> Content, isActive: Binding<Bool>) {
        self.destination = destination
        self.content = content()
        self.isActive = isActive
    }

    public var body: some View {
        Button(action: {
            isActive.wrappedValue = true
        }, label: { content })
            .background(
                NavigationLink(
                    destination: destination,
                    isActive: isActive,
                    label: { EmptyView() }
                ).isDetailLink(false).hidden()
            ).environment(\.pushingInRoot, isActive)
    }
}
