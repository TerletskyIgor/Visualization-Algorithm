//
//  InsertionSort.swift
//  Visualization_of_sorting
//
//  Created by Igor Terletskyi on 01.09.2025.
//

import Foundation

struct InsertionSort: SortingAlgorithm {
    /// Sorts an array of integers using the Insertion Sort algorithm.
    ///
    /// The algorithm iterates through the array from left to right and inserts each element
    /// into its correct position among the already sorted elements.
    ///
    /// - Parameter array: An array of integers (`Int`) to be sorted.
    /// - Returns: A new array sorted in ascending order.
    ///
    /// ### Complexity
    /// - **Time Complexity:**
    ///   - Best case (array already sorted): O(n)
    ///   - Worst case (array sorted in reverse order): O(n²)
    ///   - Average case: O(n²)
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

