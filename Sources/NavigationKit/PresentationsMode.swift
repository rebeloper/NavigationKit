//
//  PresentationsMode.swift
//  
//
//  Created by Alex Nagy on 18.02.2021.
//

import SwiftUI

public struct PresentationsModeKey: EnvironmentKey {
    public static let defaultValue: [Binding<PresentationsMode>] = []
}

extension EnvironmentValues {
    public var presentationsMode: [Binding<PresentationsMode>] {
        get { return self[PresentationsModeKey] }
        set { self[PresentationsModeKey] = newValue }
    }
}

public typealias PresentationsMode = Bool
