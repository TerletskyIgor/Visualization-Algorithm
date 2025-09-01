//
//  Model.swift
//  Visualization_of_sorting
//
//  Created by Igor Terletskyi on 01.09.2025.
//

import Foundation

struct SortingStep: Identifiable {
    let id = UUID()
    var array: [Int]
    var highlightedIndices: [Int]
}
