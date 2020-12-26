//
//  Sheet.swift
//  
//
//  Created by Alex Nagy on 26.12.2020.
//

import SwiftUI

public struct Sheet<Content>: View where Content: View {
    
    @Binding public var isPresented: Bool
    public let content: () -> Content
    
    public init(isPresented: Binding<Bool>, content: @escaping () -> Content) {
        self._isPresented = isPresented
        self.content = content
    }

    public var body: some View {
        EmptyView().sheet(isPresented: $isPresented, content: {
            content()
        })
    }
}