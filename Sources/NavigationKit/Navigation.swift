//
//  Navigation.swift
//  
//
//  Created by Alex Nagy on 23.12.2020.
//

import SwiftUI

@available(iOS 13.0, *)
public struct Navigation {
    private let action: () -> ()

    public init(_ action: @escaping () -> ()) {
        self.action = action
    }

    public func resume() {
        action()
    }
}
