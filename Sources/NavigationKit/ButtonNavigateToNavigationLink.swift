//
//  ButtonNavigateToNavigationLink.swift
//  
//
//  Created by Alex Nagy on 26.12.2020.
//

import SwiftUI

@available(iOS 13.0, *)
public struct ButtonNavigateToNavigationLink<Destination: View, Content: View>: View {
    public let destination: Destination
    public let content: Content
    public let tag: Int

    public init(destination: Destination, @ViewBuilder content: () -> Content, tag: Int) {
        self.destination = destination
        self.content = content()
        self.tag = tag
    }

    public var body: some View {
        Button(action: {
//            navigationPresentationMode.wrappedValue = tag
        }, label: {
            content
        })
//        .background(
//            NavigationLink(
//                destination: destination,
//                tag: tag,
//                selection: navigationPresentationMode,
//                label: {EmptyView()}
//            ).isDetailLink(false).hidden()
//        )
    }
}
