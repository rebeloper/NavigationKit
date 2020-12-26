//
//  PopDestination.swift
//  
//
//  Created by Alex Nagy on 26.12.2020.
//

import Foundation

/// Defines the type of a pop operation.
public enum PopDestination {
    /// Pop back to the previous view.
    case previous

    /// Pop back to the root view (i.e. the first view added to the NavigationView during the initialization process).
    case root

    /// Pop back to a view identified by a specific ID.
    case view(withId: String)
}
