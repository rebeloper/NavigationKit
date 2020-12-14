//
//  Navigation.swift
//  
//
//  Created by Alex Nagy on 14.12.2020.
//

import SwiftUI

@available(iOS 13.0, *)
public class Navigation: ObservableObject {
    @Published var isPushRootActive: Bool = false
    public init() { }
}
