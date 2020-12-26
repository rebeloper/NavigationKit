//
//  ActionDismissLink.swift
//  
//
//  Created by Alex Nagy on 25.12.2020.
//

import SwiftUI

@available(iOS 13.0, *)
public struct ActionDismissLink<Content: View>: View {
    public let content: Content
    public let action: (Navigation) -> ()

    @Environment(\.presentationMode) var presentationMode

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
            presentationMode.wrappedValue.dismiss()
        }
        action(navigation)
    }
}
