//
//  ActionNavigationLink.swift
//  
//
//  Created by Alex Nagy on 23.12.2020.
//

import SwiftUI

@available(iOS 13.0, *)
public struct ActionNavigationLink<Destination: View, Content: View>: View {
    public let destination: Destination
    public let content: Content
    public let action: (NavigationToken) -> ()

    @State public var isActive: Bool = false

    public init(destination: Destination, action: @escaping (NavigationToken) -> (), @ViewBuilder content: () -> Content) {
        self.destination = destination
        self.action = action
        self.content = content()
    }

    public var body: some View {
        Button(action: buttonAction, label: { content })
            .background(
                NavigationLink(
                    destination: destination,
                    isActive: $isActive,
                    label: { EmptyView() }
                ).isDetailLink(false)
            )
    }

    public func buttonAction() {
        let token = NavigationToken {
            self.isActive = true
        }

        action(token)
    }
}

