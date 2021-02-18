//
//  NKPush.swift
//  
//
//  Created by Alex Nagy on 13.02.2021.
//

import SwiftUI

public struct NKPush<Destination: View, Label: View>: View {
    @Binding private var root: Bool
    private let isRootSet: Bool
    private let destination: () -> Destination
    private let label: () -> Label
    
    public init(root: Binding<Bool>? = nil, destination: @escaping () -> Destination, label: @escaping () -> Label) {
        self._root = root ?? Binding.constant(false)
        self.isRootSet = root != nil
        self.destination = destination
        self.label = label
    }
    
    public var body: some View {
        if isRootSet {
            NavigationLink(destination: destination(), isActive: $root) {
                label()
            }.isDetailLink(false)
        } else {
            NavigationLink(destination: destination()) {
                label()
            }.isDetailLink(false)
        }
    }
}
