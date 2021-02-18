//
//  NavigationKitSheet.swift
//  
//
//  Created by Alex Nagy on 18.02.2021.
//

import SwiftUI

public struct NavigationKitSheet<Destination: View, Label: View>: View {
    
    @Environment(\.presentationsMode) private var presentationsMode
    
    @Binding private var isActive: Bool
    private let destination: () -> Destination
    private let onDismiss: (() -> Void)?
    private let label: () -> Label
    
    public init(isActive: Binding<Bool>, destination: @escaping () -> Destination, onDismiss: (() -> Void)? = nil, label: @escaping () -> Label) {
        self._isActive = isActive
        self.destination = destination
        self.onDismiss = onDismiss
        self.label = label
    }
    
    public var body: some View {
        Button {
            isActive.present()
        } label: {
            label()
        }
        .sheet(isPresented: $isActive, onDismiss: onDismiss) {
            destination()
                .environment(\.presentationsMode, presentationsMode + [$isActive])
        }

    }
}

