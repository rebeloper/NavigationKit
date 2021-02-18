//
//  NKPush.swift
//  
//
//  Created by Alex Nagy on 13.02.2021.
//

import SwiftUI

public struct NKPush<Destination: View, Label: View>: View {
    @Binding private var isActive: Bool
    private let destination: () -> Destination
    private let label: () -> Label
    
    public init(isActive: Binding<Bool>, destination: @escaping () -> Destination, label: @escaping () -> Label) {
        self._isActive = isActive
        self.destination = destination
        self.label = label
    }
    
    public var body: some View {
        NavigationLink(destination: destination(), isActive: $isActive) {
            label()
        }.isDetailLink(false)
    }
}
