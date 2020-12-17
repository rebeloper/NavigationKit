//
//  NKButton.swift
//  
//
//  Created by Alex Nagy on 17.12.2020.
//

import SwiftUI

@available(iOS 13.0, *)
public struct NKButton: ViewModifier {
    public func body(content: Content) -> some View {
        Button {} label: { content }
    }
}

@available(iOS 13.0, *)
extension View {
    public func asButton() -> some View {
        modifier(NKButton())
    }
}
