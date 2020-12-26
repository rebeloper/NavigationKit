//
//  EnvironmentValues+.swift
//  
//
//  Created by Alex Nagy on 16.12.2020.
//

import SwiftUI

@available(iOS 13.0, *)
struct ShowingSheetKey: EnvironmentKey {
    public static let defaultValue: Binding<Bool>? = nil
}

@available(iOS 13.0, *)
extension EnvironmentValues {
    public var showingSheet: Binding<Bool>? {
        get { self[ShowingSheetKey.self] }
        set { self[ShowingSheetKey.self] = newValue }
    }
}

@available(iOS 13.0, *)
struct PushingInRootKey: EnvironmentKey {
    public static let defaultValue: Binding<Bool>? = nil
}

@available(iOS 13.0, *)
extension EnvironmentValues {
    public var pushingInRoot: Binding<Bool>? {
        get { self[PushingInRootKey.self] }
        set { self[PushingInRootKey.self] = newValue }
    }
}
