//
//  SortViewModel.swift
//  Visualization_of_sorting
//
//  Created by Igor Terletskyi on 01.09.2025.
//

import SwiftUI

@MainActor
class SortingViewModel: ObservableObject {
    @Published var inputText: String = ""
    @Published var errorMessage: String? = nil
    @Published var steps: [SortingStep] = []
    @Published var currentStepIndex: Int = 0
    @Published var selectedAlgorithm: AlgorithmType = .bubble
    
    enum AlgorithmType: String, CaseIterable, Identifiable {
        case bubble = "Bubble Sort"
        case insertion = "Insertion Sort"
        
        var id: String { rawValue }
        
        var algorithm: SortingAlgorithm {
            switch self {
            case .bubble:
                return BubbleSort()
            case .insertion:
                return InsertionSort()
            }
        }
    }
    
    var hasStartedSorting: Bool {
        !steps.isEmpty
    }
    
    var currentStep: SortingStep? {
        guard !steps.isEmpty, currentStepIndex < steps.count else { return nil }
        return steps[currentStepIndex]
    }
    
    func startSorting() {
        guard let numbers = validateInput() else { return }
        steps = selectedAlgorithm.algorithm.sortSteps(array: numbers)
        currentStepIndex = 0
    }
    
    func stepForward() {
        guard currentStepIndex < steps.count - 1 else { return }
        currentStepIndex += 1
    }
    
    func stepBackward() {
        guard currentStepIndex > 0 else { return }
        currentStepIndex -= 1
    }
    
    func resetSorting() {
        steps = []
        currentStepIndex = 0
    }
    
    func validateInput() -> [Int]? {
        let numbers = inputText
            .split { $0 == "," || $0.isWhitespace }
            .compactMap { Int($0.trimmingCharacters(in: .whitespaces)) }
        
        let countNumbers = numbers.count
        if countNumbers == 0 {
            errorMessage = "Input cannot be empty or contain invalid characters."
            return nil
        }
        
        if countNumbers > 30 {
            errorMessage = "Maximum 30 numbers allowed."
            return nil
        }
        
        errorMessage = nil
        return numbers
    }
}

