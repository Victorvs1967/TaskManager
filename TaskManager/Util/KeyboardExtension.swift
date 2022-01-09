//
//  KeyboardExtension.swift
//  TaskManager
//
//  Created by Victor Smirnov on 09.01.2022.
//

import Foundation
import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
