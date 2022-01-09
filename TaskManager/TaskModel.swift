//
//  TaskModel.swift
//  TaskManager
//
//  Created by Victor Smirnov on 09.01.2022.
//

import Foundation
import SwiftUI

struct Task: Identifiable, Equatable {
    
    var id: String = UUID().uuidString
    var name: String
    var taskName: String
    let date: Date
    let priority: Priority
}

enum Priority: Int, Identifiable, CaseIterable {
    
    var id: Int { rawValue }
    
    case normal
    case medium
    case high
    
    var title: String {
        switch self {
        case .normal:
            return "Normal"
        case .medium:
            return "Medium"
        case .high:
            return "High"
        }
    }
    
    var color: Color {
        switch self {
        case .normal:
            return .white
        case .medium:
            return .orange
        case .high:
            return .red
        }
    }
}

enum SortType: String, Identifiable, CaseIterable {
    
    var id: String { rawValue }
    
    case alfabetical
    case date
    case priority
    
}
