//
//  BubbleSort.swift
//  Visualization_of_sorting
//
//  Created by Igor Terletskyi on 01.09.2025.
//

import Foundation

struct BubbleSort: SortingAlgorithm {
    func sortSteps(array: [Int]) -> [SortingStep] {
        var arr = array
        var steps: [SortingStep] = [SortingStep(array: arr, highlightedIndices: [])]
        
        for i in 0..<arr.count {
            for j in 0..<arr.count - i - 1 {
                steps.append(SortingStep(array: arr, highlightedIndices: [j, j + 1]))
                if arr[j] > arr[j + 1] {
                    arr.swapAt(j, j + 1)
                    steps.append(SortingStep(array: arr, highlightedIndices: [j, j + 1]))
                }
            }
        }
        
        return steps
    }
}
