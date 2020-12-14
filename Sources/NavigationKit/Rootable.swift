//
//  Rootable.swift
//  
//
//  Created by Alex Nagy on 14.12.2020.
//

import SwiftUI

@available(iOS 13.0, *)
struct Rootable: ViewModifier {
    
    let navigation = Navigation()
    
    func body(content: Content) -> some View {
        content.environmentObject(navigation)
    }
}

