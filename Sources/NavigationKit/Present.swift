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
    
    func body(content: Content) -> some View {
        ButtonPresentLink(destination: destination()) {
            content
        }
    }
}

@available(iOS 13.0, *)
struct PresentOnDismiss<Destination: View>: ViewModifier {
    
    var destination: () -> Destination
    var onDismiss: (() -> Void)?
    
    func body(content: Content) -> some View {
        ButtonPresentOnDismissLink(destination: destination(), onDismiss: onDismiss) {
            content
        }
    }
}

@available(iOS 13.0, *)
struct ActionPresent<Destination: View>: ViewModifier {
    
    var destination: () -> Destination
    var action: (NavigationToken) -> ()
    
    func body(content: Content) -> some View {
        ActionPresentLink(destination: destination(), action: action) {
            content
        }
    }
}

@available(iOS 13.0, *)
struct ActionPresentOnDismiss<Destination: View>: ViewModifier {
    
    var destination: () -> Destination
    var onDismiss: (() -> Void)?
    var action: (NavigationToken) -> ()
    
    func body(content: Content) -> some View {
        ActionPresentOnDismissLink(destination: destination(), onDismiss: onDismiss, action: action) {
            content
        }
    }
}

@available(iOS 13.0, *)
struct AsIsPresent<Destination: View>: ViewModifier {
    
    var destination: () -> Destination
    
    func body(content: Content) -> some View {
        AsIsPresentLink(destination: destination()) {
            content
        }
    }
}

@available(iOS 13.0, *)
struct AsIsPresentOnDismiss<Destination: View>: ViewModifier {
    
    var destination: () -> Destination
    var onDismiss: (() -> Void)?
    
    func body(content: Content) -> some View {
        AsIsPresentOnDismissLink(destination: destination(), onDismiss: onDismiss) {
            content
        }
    }
}

@available(iOS 13.0, *)
struct PresentNavigationView<Destination: View>: ViewModifier {
    
    var destination: () -> Destination
    @State var isPresented: Bool
    
    func body(content: Content) -> some View {
        content.onTapGesture {
            isPresented = true
        }
        .sheet(isPresented: $isPresented) {
            destination().environment(\.showingSheet, $isPresented)
        }
    }
}

@available(iOS 13.0, *)
struct PresentNavigationViewOnDismiss<Destination: View>: ViewModifier {
    
    var destination: () -> Destination
    var onDismiss: (() -> Void)?
    @State var isPresented: Bool
    
    func body(content: Content) -> some View {
        content.onTapGesture {
            isPresented = true
        }
        .sheet(isPresented: $isPresented, onDismiss: onDismiss) {
            destination().environment(\.showingSheet, $isPresented)
        }
    }
}
