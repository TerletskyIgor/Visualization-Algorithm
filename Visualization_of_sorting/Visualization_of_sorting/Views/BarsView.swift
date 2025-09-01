//
//  BarsView.swift
//  Visualization_of_sorting
//
//  Created by Igor Terletskyi on 01.09.2025.
//

import SwiftUI

struct BarsView: View {
    let step: SortingStep
    
    var body: some View {
        GeometryReader { geo in
            let maxVal = (step.array.max() ?? 1)
            let barWidth = geo.size.width / CGFloat(step.array.count)
            
            HStack(spacing: 2) {
                ForEach(step.array.indices, id: \.self) { index in
                    let value = step.array[index]
                    let heightRatio = CGFloat(value) / CGFloat(maxVal)
                    
                    Rectangle()
                        .fill(step.highlightedIndices.contains(index) ? Color.red : Color.blue)
                        .frame(
                            width: barWidth,
                            height: geo.size.height * heightRatio
                        )
                        .animation(.easeInOut, value: step.array)
                }
            }
        }
    }
}

#Preview {
    BarsView(
        step: SortingStep(
            array: [5, 2, 8, 3, 7],
            highlightedIndices: [1, 3]
        )
    )
    .frame(height: 200)
    .padding()
}
