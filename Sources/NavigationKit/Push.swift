//
//  Push.swift
//  
//
//  Created by Alex Nagy on 14.12.2020.
//

import SwiftUI

@available(iOS 13.0, *)
struct Push<Destination: View>: ViewModifier {

    var destination: () -> Destination

    func body(content: Content) -> some View {
        ButtonNavigationLink(destination: destination()) {
            content
        }
    }
}

@available(iOS 13.0, *)
struct ActionPush<Destination: View>: ViewModifier {

    var destination: () -> Destination
    var action: (NavigationToken) -> ()

    func body(content: Content) -> some View {
        ActionNavigationLink(destination: destination(), action: action) {
            content
        }
    }
}

@available(iOS 13.0, *)
struct AsIsPush<Destination: View>: ViewModifier {

    var destination: () -> Destination

    func body(content: Content) -> some View {
        AsIsNavigationLink(destination: destination()) {
            content
        }
    }
}

@available(iOS 13.0, *)
struct PushAsRoot<Destination: View>: ViewModifier {

    let tag: Int
    var destination: () -> Destination
    @EnvironmentObject var navigation: Navigation

    func body(content: Content) -> some View {
        ZStack {
            content.onTapGesture {
                navigation.tag = tag
            }
            NavigationLink(
                destination: destination(),
                tag: tag,
                selection: navigation.$tag,
                label: {EmptyView()}).isDetailLink(false)
        }
    }
}
