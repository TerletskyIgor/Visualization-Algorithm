//
//  InsertionSort.swift
//  Visualization_of_sorting
//
//  Created by Igor Terletskyi on 01.09.2025.
//

import Foundation

struct InsertionSort: SortingAlgorithm {
    func sortSteps(array: [Int]) -> [SortingStep] {
        var arr = array
        var steps: [SortingStep] = [SortingStep(array: arr, highlightedIndices: [])]
        
        for i in 1..<arr.count {
            var j = i
            while j > 0 && arr[j] < arr[j - 1] {
                steps.append(SortingStep(array: arr, highlightedIndices: [j, j - 1]))
                arr.swapAt(j, j - 1)
                steps.append(SortingStep(array: arr, highlightedIndices: [j, j - 1]))
                j -= 1
            }
        }
        
        return steps
    }
}

