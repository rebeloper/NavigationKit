//
//  ButtonPresentOnDismissNavigationViewLink.swift
//  
//
//  Created by Alex Nagy on 25.12.2020.
//

import SwiftUI

@available(iOS 13.0, *)
public struct ButtonPresentOnDismissNavigationViewLink<Destination: View, Content: View>: View {
    public let destination: Destination
    public let onDismiss: (() -> Void)?
    public let content: Content

    @State public var isActive: Bool = false

    public init(destination: Destination, onDismiss: (() -> Void)?, @ViewBuilder content: () -> Content) {
        self.destination = destination
        self.onDismiss = onDismiss
        self.content = content()
    }

    public var body: some View {
        Button(action: {
            isActive = true
        }, label: {
            content
        })
        .sheet(isPresented: $isActive, onDismiss: onDismiss, content: {
            destination.environment(\.showingSheet, $isActive)
        })
    }
}
