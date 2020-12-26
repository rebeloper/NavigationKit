//
//  SwipeToDismissView.swift
//  
//
//  Created by Alex Nagy on 16.12.2020.
//

import SwiftUI

struct SwipeToDismissView: UIViewControllerRepresentable {
    var dismissable: () -> Bool = { false }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<SwipeToDismissView>) -> UIViewController {
        SwipeToDismissViewController(dismissable: self.dismissable)
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}

extension SwipeToDismissView {
    private final class SwipeToDismissViewController: UIViewController, UIAdaptivePresentationControllerDelegate {
        let dismissable: () -> Bool
        
        init(dismissable: @escaping () -> Bool) {
            self.dismissable = dismissable
            super.init(nibName: nil, bundle: nil)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func didMove(toParent parent: UIViewController?) {
            super.didMove(toParent: parent)
            setup()
        }
        
        func presentationControllerShouldDismiss(_ presentationController: UIPresentationController) -> Bool {
            dismissable()
        }
        
        private func setup() {
            guard let rootPresentationViewController = self.rootParent.presentationController, rootPresentationViewController.delegate == nil else { return }
            rootPresentationViewController.delegate = self
        }
    }
}

extension UIViewController {
    fileprivate var rootParent: UIViewController {
        if let parent = self.parent {
            return parent.rootParent
        }
        else {
            return self
        }
    }
}

extension View {
    public func disableSwipeToDismiss() -> some View {
        self.background(SwipeToDismissView(dismissable: { false }))
    }
    
    public func allowsSwipeToDismiss(_ dismissable: Bool) -> some View {
        self.background(SwipeToDismissView(dismissable: { dismissable }))
    }
}

