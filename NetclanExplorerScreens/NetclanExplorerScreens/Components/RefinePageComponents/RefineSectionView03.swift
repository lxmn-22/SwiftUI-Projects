//
//  RefineSectionView03.swift
//  NetclanExplorerScreens
//
//  Created by Laxman Singh Koranga on 11/07/2024.
//

import SwiftUI

struct RefineSectionView03: View {
    @State private var sliderValue: Double = 0.0
    @State private var secondParameter: String = "1"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            VStack {
                Text("Select Hyperlocal Distance")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.bannerFont)
            }
            
            // Slider.
            VStack {
                Slider(value: $sliderValue, in: 0...1.6)
                    .onChange(of: sliderValue) { _, newValue in
                        updateSecondParameter(newValue)
                    }
//                Text("Second Parameter: \(secondParameter)")
                
                // Distance meter.
                HStack {
                    Text("1 Km")
                    Spacer()
                    Text("\(secondParameter) Km")
                }
                .font(.caption)
                .foregroundStyle(.bannerFont)
            }
        }
        .frame(maxWidth: 350, maxHeight: 140)
    }
    
    func updateSecondParameter(_ sliderValue: Double) {
        let newSecondParameterValue = sliderValue * 100
        secondParameter = String(format: "%.2f", newSecondParameterValue)
    }
}

#Preview {
    RefineSectionView03()
}
