//
//  ContentView.swift
//  Visualization_of_sorting
//
//  Created by Igor Terletskyi on 01.09.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = SortingViewModel()
    
    @ViewBuilder
    var navigationButton: some View {
        VStack {
            Button(viewModel.hasStartedSorting ? "Refresh" : "Start") {
                viewModel.startSorting()
            }
            .padding(.bottom, 10)
            
            if viewModel.hasStartedSorting {
                HStack {
                    Button("◀︎ Back") {
                        viewModel.stepBackward()
                    }
                    Spacer()
                    Button("Forward ▶︎") {
                        viewModel.stepForward()
                    }
                }
                .padding()
            }
        }
    }
    
    var algorithmPicker: some View {
        Picker("Algorithm", selection: $viewModel.selectedAlgorithm) {
            ForEach(SortingViewModel.AlgorithmType.allCases) { algo in
                Text(algo.rawValue).tag(algo)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .onChange(of: viewModel.selectedAlgorithm, { _ , _ in
            viewModel.resetSorting()
        })
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
    var barsView: some View {
        if let step = viewModel.currentStep {
            BarsView(step: step).frame(height: 300)
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
            barsView
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
