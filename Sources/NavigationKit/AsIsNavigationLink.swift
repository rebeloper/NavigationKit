//
//  AsIsNavigationLink.swift
//  
//
//  Created by Alex Nagy on 23.12.2020.
//

import SwiftUI

@available(iOS 13.0, *)
public struct AsIsNavigationLink<Destination: View, Content: View>: View {
    public let destination: Destination
    public let content: Content
    
    @State public var isActive: Bool = false
    
    public init(destination: Destination, @ViewBuilder content: () -> Content) {
        self.destination = destination
        self.content = content()
    }
    
    public var body: some View {
        content.onTapGesture {
            isActive = true
        }.background(
            NavigationLink(
                destination: destination,
                isActive: $isActive,
                label: { EmptyView() }
            ).isDetailLink(false).hidden()
        )
    }
}
