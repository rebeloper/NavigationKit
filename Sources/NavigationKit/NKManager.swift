//
//  NKManager.swift
//  
//
//  Created by Alex Nagy on 18.02.2021.
//

import SwiftUI

public struct NKManager {
    public static func dismissTwo(with presentationsMode: [Binding<Bool>]) {
        presentationsMode.forEach {
            $0.wrappedValue.dismiss()
        }
    }
}
