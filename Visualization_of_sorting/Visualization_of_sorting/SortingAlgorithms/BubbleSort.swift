//
//  BubbleSort.swift
//  Visualization_of_sorting
//
//  Created by Igor Terletskyi on 01.09.2025.
//

import Foundation

struct BubbleSort: SortingAlgorithm {
    /// Sorts an array of integers using the Bubble Sort algorithm.
    ///
    /// Bubble Sort repeatedly steps through the array, compares adjacent elements,
    /// and swaps them if they are in the wrong order. This process is repeated
    /// until the array is sorted.
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
