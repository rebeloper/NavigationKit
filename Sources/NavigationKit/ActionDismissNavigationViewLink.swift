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
    public let action: (Navigation) -> ()

    @Environment(\.showingSheet) var showingSheet

    public init(action: @escaping (Navigation) -> (), @ViewBuilder content: () -> Content) {
        self.action = action
        self.content = content()
    }

    public var body: some View {
        Button(action: buttonAction, label: {
            content
        })
    }
    
    public func buttonAction() {
        let navigation = Navigation {
            showingSheet?.wrappedValue.dismiss()
        }
        action(navigation)
    }
}
