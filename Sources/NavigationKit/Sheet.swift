//
//  Sheet.swift
//  
//
//  Created by Alex Nagy on 26.12.2020.
//

import SwiftUI

public struct Sheet<Content>: View where Content: View {
    
    @Binding public var isPresented: Bool
    public let onDismiss: (() -> Void)?
    public let content: () -> Content
    
    public init(isPresented: Binding<Bool>, onDismiss: (() -> Void)? = nil, content: @escaping () -> Content) {
        self._isPresented = isPresented
        self.onDismiss = onDismiss
        self.content = content
    }

    public var body: some View {
        EmptyView().sheet(isPresented: $isPresented, onDismiss: onDismiss, content: {
            content()
        })
    }
}
