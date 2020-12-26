//
//  Navigation.swift
//  
//
//  Created by Alex Nagy on 26.12.2020.
//

import SwiftUI

private enum NavigationType {
    case push
    case pop
}

//the actual element in the stack
private struct ViewElement: Identifiable, Equatable {
    let id: String
    let wrappedElement: AnyView

    static func == (lhs: ViewElement, rhs: ViewElement) -> Bool {
        lhs.id == rhs.id
    }
}

public class Navigation: ObservableObject {
    fileprivate private(set) var navigationType = NavigationType.push
    /// Customizable easing to apply in pop and push transitions
    private let easing: Animation
    
    init(easing: Animation) {
        self.easing = easing
    }
    
    private var viewStack = ViewStack() {
        didSet {
            currentView = viewStack.peek()
        }
    }

    @Published fileprivate var currentView: ViewElement?

    /// Navigates to a view.
    /// - Parameters:
    ///   - element: The destination view.
    ///   - identifier: The ID of the destination view (used to easily come back to it if needed).
    public func push<Element: View>(_ element: Element, withId identifier: String? = nil) {
        withAnimation(easing) {
            navigationType = .push
            viewStack.push(ViewElement(id: identifier == nil ? UUID().uuidString : identifier!, wrappedElement: AnyView(element)))
        }
    }

    /// Navigates back to a previous view.
    /// - Parameter to: The destination type of the transition operation.
    public func pop(to: PopDestination = .previous) {
        withAnimation(easing) {
            navigationType = .pop
            switch to {
            case .root:
                viewStack.popToRoot()
            case .view(let viewId):
                viewStack.popToView(withId: viewId)
            default:
                viewStack.popToPrevious()
            }
        }
    }

    //the actual stack
    private struct ViewStack {
        private var views = [ViewElement]()

        func peek() -> ViewElement? {
            views.last
        }

        mutating func push(_ element: ViewElement) {
            guard indexForView(withId: element.id) == nil else {
                print("Duplicated view identifier: \"\(element.id)\". You are trying to push a view with an identifier that already exists on the navigation stack.")
                return
            }
            views.append(element)
        }

        mutating func popToPrevious() {
            _ = views.popLast()
        }

        mutating func popToView(withId identifier: String) {
            guard let viewIndex = indexForView(withId: identifier) else {
                print("Identifier \"\(identifier)\" not found. You are trying to pop to a view that doesn't exist.")
                return
            }
            views.removeLast(views.count - (viewIndex + 1))
        }

        mutating func popToRoot() {
            views.removeAll()
        }

        private func indexForView(withId identifier: String) -> Int? {
            views.firstIndex {
                $0.id == identifier
            }
        }
    }
}

/// An alternative SwiftUI NavigationView implementing classic stack-based navigation giving also some more control on animations and programmatic navigation.
public struct NavigationKitView<Root>: View where Root: View {
    @ObservedObject private var navViewModel: Navigation
    private let rootViewID = "root"
    private let rootView: Root
    private let transitions: (push: AnyTransition, pop: AnyTransition)

    /// Creates a NavigationKitView.
    /// - Parameters:
    ///   - transitionType: The type of transition to apply between views in every push and pop operation.
    ///   - easing: The easing function to apply to every push and pop operation.
    ///   - rootView: The very first view in the Navigation.
    public init(transitionType: NavigationTransition = .default, easing: Animation = .easeOut(duration: 0.2), @ViewBuilder rootView: () -> Root) {
        self.rootView = rootView()
        self.navViewModel = Navigation(easing: easing)
        switch transitionType {
        case .none:
            self.transitions = (.identity, .identity)
        case .custom(let trans):
            self.transitions = (trans, trans)
        default:
            self.transitions = NavigationTransition.defaultTransitions
        }
    }

    public var body: some View {
        let showRoot = navViewModel.currentView == nil
        let navigationType = navViewModel.navigationType

        return ZStack {
            Group {
                if showRoot {
                    rootView
                        .id(rootViewID)
                        .transition(navigationType == .push ? transitions.push : transitions.pop)
                        .environmentObject(navViewModel)
                } else {
                    navViewModel.currentView!.wrappedElement
                        .id(navViewModel.currentView!.id)
                        .transition(navigationType == .push ? transitions.push : transitions.pop)
                        .environmentObject(navViewModel)
                }
            }
        }
    }
}

