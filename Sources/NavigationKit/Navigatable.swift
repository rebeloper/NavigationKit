//
//  Navigatable.swift
//  
//
//  Created by Alex Nagy on 14.12.2020.
//

import SwiftUI

@available(iOS 13.0, *)
struct Navigatable: ViewModifier {
    
    let navigation = Navigation()
    
    func body(content: Content) -> some View {
        content.environmentObject(navigation)
    }
}

