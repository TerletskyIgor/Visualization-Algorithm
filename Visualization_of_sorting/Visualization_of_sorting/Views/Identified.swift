//
//  Identified.swift
//  Visualization_of_sorting
//
//  Created by Igor Terletskyi on 01.09.2025.
//

import Foundation

struct Identified<T>: Identifiable {
    let id = UUID()
    let value: T
}
