//
//  ActionNavigationLink.swift
//  
//
//  Created by Alex Nagy on 23.12.2020.
//

import SwiftUI

@available(iOS 13.0, *)
public struct ActionNavigationLink<Destination: View, Content: View>: View {
    private let destination: Destination
    private let content: Content
    private let action: (NavigationToken) -> ()

    @State private var continueToDestination: Bool = false

    public init(
        destination: Destination,
        action: @escaping (NavigationToken) -> (),
        @ViewBuilder content: () -> Content) {
        self.destination = destination
        self.action = action
        self.content = content()
    }

    public var body: some View {
        Button(action: buttonAction, label: { content })
            .background(
                NavigationLink(
                    destination: destination,
                    isActive: $continueToDestination,
                    label: { EmptyView() }
                ).isDetailLink(false)
            )
    }

    private func buttonAction() {
        let token = NavigationToken {
            self.continueToDestination = true
        }

        action(token)
    }
}

