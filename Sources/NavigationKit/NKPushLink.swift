//
//  NKPushLink.swift
//  
//
//  Created by Alex Nagy on 18.02.2021.
//

import SwiftUI

public struct NKPushLink<Destination: View>: View {
    @Binding private var root: Bool
    private let destination: () -> Destination
    
    public init(root: Binding<Bool>, destination: @escaping () -> Destination) {
        self._root = root
        self.destination = destination
    }
    
    public var body: some View {
        NavigationLink(destination: destination(), isActive: $root) {
            EmptyView()
        }.isDetailLink(false)
    }
}
