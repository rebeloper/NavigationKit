//
//  Dismiss.swift
//  
//
//  Created by Alex Nagy on 14.12.2020.
//

import SwiftUI

@available(iOS 13.0, *)
struct Dismiss: ViewModifier {
    func body(content: Content) -> some View {
        ButtonDismissLink {
            content
        }
    }
}

@available(iOS 13.0, *)
struct ActionDismiss: ViewModifier {
    
    var action: (NavigationToken) -> ()

    func body(content: Content) -> some View {
        ActionDismissLink(action: action) {
            content
        }
    }
}

@available(iOS 13.0, *)
struct DismissAsIs: ViewModifier {
    func body(content: Content) -> some View {
        AsIsDismissLink {
            content
        }
    }
}

@available(iOS 13.0, *)
struct DismissToRoot: ViewModifier {
    
    @EnvironmentObject var navigation: Navigation
    
    func body(content: Content) -> some View {
        content.onTapGesture {
            navigation.isPushRootActive = false
        }
    }
}

@available(iOS 13.0, *)
struct DismissNavigationViewSheet: ViewModifier {
    func body(content: Content) -> some View {
        ButtonDismissNavigationViewLink {
            content
        }
    }
}

@available(iOS 13.0, *)
struct ActionDismissNavigationViewSheet: ViewModifier {
    
    var action: (NavigationToken) -> ()
    
    func body(content: Content) -> some View {
        ActionDismissNavigationViewLink(action: action) {
            content
        }
    }
}

@available(iOS 13.0, *)
struct AsIsDismissNavigationViewSheet: ViewModifier {
    func body(content: Content) -> some View {
        AsIsDismissNavigationViewLink {
            content
        }
    }
}
