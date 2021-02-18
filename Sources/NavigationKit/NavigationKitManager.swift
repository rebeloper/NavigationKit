//
//  NavigationKitManager.swift
//  
//
//  Created by Alex Nagy on 18.02.2021.
//

import SwiftUI

public struct NavigationKitManager {
    public static func dismissTwo(with presentationsMode: [Binding<Bool>]) {
        presentationsMode.forEach {
            $0.wrappedValue.dismiss()
        }
    }
}
