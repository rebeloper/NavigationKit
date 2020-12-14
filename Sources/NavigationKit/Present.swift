//
//  Present.swift
//  
//
//  Created by Alex Nagy on 14.12.2020.
//

import SwiftUI

@available(iOS 13.0, *)
struct Present<Destination: View>: ViewModifier {
    
    var destination: () -> Destination
    @State var isPresented: Bool
    
    func body(content: Content) -> some View {
        content.onTapGesture {
            isPresented = true
        }.sheet(isPresented: $isPresented, content: destination)
    }
}

@available(iOS 13.0, *)
struct PresentOnDismiss<Destination: View>: ViewModifier {
    
    var destination: () -> Destination
    var onDismiss: (() -> Void)?
    @State var isPresented: Bool
    
    func body(content: Content) -> some View {
        content.onTapGesture {
            isPresented = true
        }.sheet(isPresented: $isPresented, onDismiss: onDismiss, content: destination)
    }
}
