//
//  View+.swift
//  
//
//  Created by Alex Nagy on 14.12.2020.
//

import SwiftUI

@available(iOS 13.0, *)
extension View {
    
    public func rootable(_ navigation: Navigation = Navigation()) -> some View {
        modifier(Rootable(navigation: navigation))
    }
    
    public func pushes<Destination: View>(_ destination: Destination) -> some View {
        modifier(Push(destination: {
            destination
        }))
    }
    
    public func pushes<Destination: View>(_ destination: Destination, after action: @escaping (NavigationToken) -> ()) -> some View {
        modifier(ActionPush(destination: {
            destination
        }, action: action))
    }
    
    public func pushesAsIs<Destination: View>(_ destination: Destination) -> some View {
        modifier(AsIsPush(destination: {
            destination
        }))
    }
    
    public func pushesAsRoot<Destination: View>(_ destination: Destination) -> some View {
        modifier(PushAsRoot(destination: {
            destination
        }))
    }
    
    public func dismisses() -> some View {
        modifier(Dismiss())
    }
    
    public func dismisses(after action: @escaping (NavigationToken) -> ()) -> some View {
        modifier(ActionDismiss(action: action))
    }
    
    public func dismissesAsIs() -> some View {
        modifier(DismissAsIs())
    }
    
    public func dismissesToRoot() -> some View {
        modifier(DismissToRoot())
    }
    
    public func dismissesNavigationViewSheet() -> some View {
        return modifier(DismissNavigationViewSheet())
    }
    
    public func presents<Destination: View>(_ destination: Destination, allowsSwipeToDismiss: Bool = true) -> some View {
        modifier(Present(destination: {
            destination.allowsSwipeToDismiss(allowsSwipeToDismiss)
        }))
    }
    
    public func presents<Destination: View>(_ destination: Destination, allowsSwipeToDismiss: Bool = true, onDismiss: (() -> Void)?) -> some View {
        modifier(PresentOnDismiss(destination: {
            destination.allowsSwipeToDismiss(allowsSwipeToDismiss)
        }, onDismiss: onDismiss))
    }
    
    public func presents<Destination: View>(_ destination: Destination, after action: @escaping (NavigationToken) -> (), allowsSwipeToDismiss: Bool = true) -> some View {
        modifier(ActionPresent(destination: {
            destination.allowsSwipeToDismiss(allowsSwipeToDismiss)
        }, action: action))
    }
    
    public func presents<Destination: View>(_ destination: Destination, onDismiss: (() -> Void)?, after action: @escaping (NavigationToken) -> (), allowsSwipeToDismiss: Bool = true) -> some View {
        modifier(ActionPresentOnDismiss(destination: {
            destination.allowsSwipeToDismiss(allowsSwipeToDismiss)
        }, onDismiss: onDismiss, action: action))
    }
    
    public func presentsAsIs<Destination: View>(_ destination: Destination, allowsSwipeToDismiss: Bool = true) -> some View {
        modifier(AsIsPresent(destination: {
            destination.allowsSwipeToDismiss(allowsSwipeToDismiss)
        }))
    }
    
    public func presentsAsIs<Destination: View>(_ destination: Destination, allowsSwipeToDismiss: Bool = true, onDismiss: (() -> Void)?) -> some View {
        modifier(AsIsPresentOnDismiss(destination: {
            destination.allowsSwipeToDismiss(allowsSwipeToDismiss)
        }, onDismiss: onDismiss))
    }
    
    public func presentsNavigationView<Destination: View>(_ destination: Destination, allowsSwipeToDismiss: Bool = true) -> some View {
        modifier(PresentNavigationView(destination: {
            NavigationView {
                destination.allowsSwipeToDismiss(allowsSwipeToDismiss)
            }
        }, isPresented: false))
    }
    
    public func presentsNavigationView<Destination: View>(_ destination: Destination, allowsSwipeToDismiss: Bool = true, onDismiss: (() -> Void)?) -> some View {
        modifier(PresentNavigationViewOnDismiss(destination: {
            NavigationView {
                destination.allowsSwipeToDismiss(allowsSwipeToDismiss)
            }
        }, onDismiss: onDismiss, isPresented: false))
    }
    
}
