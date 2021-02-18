//
//  NavigationKitManager.swift
//  
//
//  Created by Alex Nagy on 18.02.2021.
//

import SwiftUI

public struct NavigationKitManager {
    public static func dismiss(with presentationMode: Binding<PresentationMode>) {
        presentationMode.wrappedValue.dismiss()
    }
    
    public static func dismissTwo(with presentationsMode: [Binding<RootPresentationMode>]) {
        presentationsMode.forEach {
            $0.wrappedValue.dismiss()
        }
    }
}
