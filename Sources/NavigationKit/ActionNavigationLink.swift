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
    public let action: (Navigation) -> ()

    @State public var isActive: Bool = false

    public init(destination: Destination, action: @escaping (Navigation) -> (), @ViewBuilder content: () -> Content) {
        self.destination = destination
        self.action = action
        self.content = content()
    }

    public var body: some View {
        Button(action: buttonAction, label: {
                content
        })
        .background(
            NavigationLink(
                destination: destination,
                isActive: $isActive,
                label: { EmptyView() }
            ).isDetailLink(false).hidden()
        )
    }

    public func buttonAction() {
        let navigation = Navigation {
            self.isActive = true
        }
        action(navigation)
    }
}

