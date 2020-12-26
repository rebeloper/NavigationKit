//
//  NavigationPresentationModeKey.swift
//  
//
//  Created by Alex Nagy on 26.12.2020.
//

import SwiftUI

public struct NavigationPresentationModeKey: EnvironmentKey {
    public static let defaultValue: Binding<NavigationPresentationMode> = .constant(NavigationPresentationMode(nil))
}

public extension EnvironmentValues {
    var navigationPresentationMode: Binding<NavigationPresentationMode> {
        get { return self[NavigationPresentationModeKey.self] }
        set { self[NavigationPresentationModeKey.self] = newValue }
    }
}

public typealias NavigationPresentationMode = Int?

public extension NavigationPresentationMode {
    
    mutating func navigateTo(_ tag: Int) {
        self = tag
    }
}
