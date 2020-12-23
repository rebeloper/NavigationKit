//
//  NavigationToken.swift
//  
//
//  Created by Alex Nagy on 23.12.2020.
//

import SwiftUI

@available(iOS 13.0, *)
public struct NavigationToken {
    private let navigationAction: () -> ()

    public init(_ action: @escaping () -> ()) {
        self.navigationAction = action
    }

    public func navigate() {
        navigationAction()
    }
}
