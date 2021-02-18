//
//  PushView.swift
//  
//
//  Created by Alex Nagy on 13.02.2021.
//

import SwiftUI

public struct PushView<Destination: View, Label: View>: View {
    @Binding private var isActive: Bool
    private let isActiveSet: Bool
    private let destination: () -> Destination
    private let label: () -> Label
    
    public init(isActive: Binding<Bool>? = nil, destination: @escaping () -> Destination, label: @escaping () -> Label) {
        self._isActive = isActive ?? Binding.constant(false)
        self.isActiveSet = isActive != nil
        self.destination = destination
        self.label = label
    }
    
    public var body: some View {
        if isActiveSet {
            NavigationLink(destination: destination(), isActive: $isActive) {
                label()
            }.isDetailLink(false)
        } else {
            NavigationLink(destination: destination()) {
                label()
            }.isDetailLink(false)
        }
    }
}
