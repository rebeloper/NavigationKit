//
//  SystemImageButton.swift
//  
//
//  Created by Alex Nagy on 13.02.2021.
//

import SwiftUI

public struct SystemImageButton: View {
    
    private let action: () -> ()
    private let name: String
    private let font: Font?
    
    public init(action: @escaping () -> (), name: String, font: Font? = nil) {
        self.action = action
        self.name = name
        self.font = font
    }
    
    public var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: name)
                .font(font)
        }

    }
}
