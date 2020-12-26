//
//  ButtonAsRootNavigationLink.swift
//  
//
//  Created by Alex Nagy on 26.12.2020.
//

import SwiftUI

@available(iOS 13.0, *)
public struct ButtonAsRootNavigationLink<Destination: View, Content: View>: View {
    public let destination: Destination
    public let content: Content
    public let tag: Int
    public var selection: Binding<Int?>

    public init(destination: Destination, @ViewBuilder content: () -> Content, tag: Int, selection: Binding<Int?>) {
        self.destination = destination
        self.content = content()
        self.tag = tag
        self.selection = selection
    }

    public var body: some View {
        Button(action: {
            selection.wrappedValue = tag
        }, label: {
            content
        })
        .background(
            NavigationLink(
                destination: destination,
                tag: tag,
                selection: selection,
                label: {EmptyView()}
            ).isDetailLink(false).hidden()
        )
    }
}
