//
//  FullScreenSheet.swift
//  
//
//  Created by Alex Nagy on 26.12.2020.
//

import SwiftUI

@available(iOS 14.0, *)
public struct FullScreenSheet<Content>: View where Content: View {
    
    @Binding public var isPresented: Bool
    public let content: () -> Content

    public var body: some View {
        EmptyView().fullScreenCover(isPresented: $isPresented) {
            content()
        }
    }
}
