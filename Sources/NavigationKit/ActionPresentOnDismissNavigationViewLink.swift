//
//  ActionPresentOnDismissNavigationViewLink.swift
//  
//
//  Created by Alex Nagy on 25.12.2020.
//

import SwiftUI

@available(iOS 13.0, *)
public struct ActionPresentOnDismissNavigationViewLink<Destination: View, Content: View>: View {
    public let destination: Destination
    public let onDismiss: (() -> Void)?
    public let content: Content
    public let action: (NavigationToken) -> ()

    @State public var isActive: Bool = false

    public init(destination: Destination, onDismiss: (() -> Void)?, action: @escaping (NavigationToken) -> (), @ViewBuilder content: () -> Content) {
        self.destination = destination
        self.onDismiss = onDismiss
        self.action = action
        self.content = content()
    }

    public var body: some View {
        Button(action: buttonAction, label: {
                content
        })
        .sheet(isPresented: $isActive, onDismiss: onDismiss, content: {
            destination.environment(\.showingSheet, $isActive)
        })
    }

    public func buttonAction() {
        let token = NavigationToken {
            self.isActive = true
        }

        action(token)
    }
}
