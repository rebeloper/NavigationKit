//
//  RootPresentationMode.swift
//  
//
//  Created by Alex Nagy on 13.02.2021.
//

import SwiftUI

public struct RootPresentationModeKey: EnvironmentKey {
    public static let defaultValue: Binding<RootPresentationMode> = .constant(RootPresentationMode())
}

extension EnvironmentValues {
    public var rootPresentationMode: Binding<RootPresentationMode> {
        get { return self[RootPresentationModeKey] }
        set { self[RootPresentationModeKey] = newValue }
    }
}

public typealias RootPresentationMode = Bool
