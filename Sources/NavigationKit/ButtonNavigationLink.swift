//
//  ButtonNavigationLink.swift
//  
//
//  Created by Alex Nagy on 23.12.2020.
//

import SwiftUI

@available(iOS 13.0, *)
public struct ButtonNavigationLink<Destination: View, Content: View>: View {
    public let destination: Destination
    public let content: Content

    @State public var isActive: Bool = false
    @Environment(\.pushingInRoot) var pushingInRoot

    public init(destination: Destination, @ViewBuilder content: () -> Content) {
        self.destination = destination
        self.content = content()
    }

    public var body: some View {
        Button(action: {
            isActive = true
        }, label: { content })
            .background(
                NavigationLink(
                    destination: destination.environment(\.pushingInRoot, $isActive),
                    isActive: $isActive,
                    label: { EmptyView() }
                ).isDetailLink(false).hidden()
            )
    }
}


