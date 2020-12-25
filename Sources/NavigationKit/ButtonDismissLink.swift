//
//  ButtonDismissLink.swift
//  
//
//  Created by Alex Nagy on 25.12.2020.
//

import SwiftUI

@available(iOS 13.0, *)
public struct ButtonDismissLink<Content: View>: View {
    public let content: Content

    @Environment(\.presentationMode) var presentationMode

    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    public var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            content
        })
    }
}
