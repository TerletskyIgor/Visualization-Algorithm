//
//  ContentView.swift
//  Visualization_of_sorting
//
//  Created by Igor Terletskyi on 01.09.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = SortingViewModel()
    
    var navigationButton: some View {
        VStack {
            Button("Start") { viewModel.startSorting() }
            HStack {
                Button("◀︎ Back") { viewModel.stepBackward() }
                Spacer()
                Button("Forward ▶︎") { viewModel.stepForward() }
            }
            .padding()

        }
    }
    
    var algorithmPicker: some View {
        Picker("Algorithm", selection: $viewModel.selectedAlgorithm) {
            ForEach(SortingViewModel.AlgorithmType.allCases) { algo in
                Text(algo.rawValue).tag(algo)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
    }
    
    var inputView: some View {
        VStack(alignment: .leading, spacing: 4) {
            TextField("Enter numbers separated by commas", text: $viewModel.inputText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            if let error = viewModel.errorMessage {
                Text(error)
                    .font(.subheadline)
                    .foregroundColor(.red)
            }
            
            Text(viewModel.currentArrayText)
                   .font(.system(.body, design: .monospaced))
                   .foregroundColor(.primary)
                   .padding(.top, 4)
        }
    }
    
    @ViewBuilder
    var currentSortingStep: some View {
        if let step = viewModel.currentStep {
            HStack(alignment: .bottom, spacing: 8) {
                ForEach(step.array.indices, id: \.self) { index in
                    Rectangle()
                        .fill(step.highlightedIndices.contains(index) ? Color.red : Color.blue)
                        .frame(width: 20, height: CGFloat(step.array[index]) * 10)
                        .animation(.easeInOut, value: step.array)
                }
            }
            .frame(height: 300)
            .padding()
        }
    }
    
    var body: some View {
        VStack(spacing: 20) {
            inputView
            .padding()
            algorithmPicker
            navigationButton
            Spacer()
            currentSortingStep
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
