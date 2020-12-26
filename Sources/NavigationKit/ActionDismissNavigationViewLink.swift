//
//  ActionDismissNavigationViewLink.swift
//  
//
//  Created by Alex Nagy on 25.12.2020.
//

import SwiftUI

@available(iOS 13.0, *)
public struct ActionDismissNavigationViewLink<Content: View>: View {
    public let content: Content
    public let action: (NavigationToken) -> ()

    @Environment(\.showingSheet) var showingSheet

    public init(action: @escaping (NavigationToken) -> (), @ViewBuilder content: () -> Content) {
        self.action = action
        self.content = content()
    }

    public var body: some View {
        Button(action: buttonAction, label: {
            content
        })
    }
    
    public func buttonAction() {
        let token = NavigationToken {
            showingSheet?.wrappedValue.dismiss()
        }

        action(token)
    }
}
