//
//  View+.swift
//  
//
//  Created by Alex Nagy on 13.02.2021.
//

import SwiftUI

extension View {
    @ViewBuilder public func isHidden(_ shouldHide: Bool) -> some View {
        switch shouldHide {
        case true: self.hidden()
        case false: self
        }
    }
    
    @ViewBuilder public func isScaledToFill(_ shouldScaledToFill: Bool) -> some View {
        switch shouldScaledToFill {
        case true: self.scaledToFill()
        case false: self.scaledToFit()
        }
    }
}
