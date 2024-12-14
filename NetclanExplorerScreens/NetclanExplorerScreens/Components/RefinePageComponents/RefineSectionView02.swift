//
//  RefineSectionView02.swift
//  NetclanExplorerScreens
//
//  Created by Laxman Singh Koranga on 11/07/2024.
//

import SwiftUI

struct RefineSectionView02: View {
    @State private var statusField: String = "Hi, community! I am open to new connection 😊"
    @State private var charCount: Int = 44
    private let charLimit = 250
    
    var body: some View {
        // Heading-02
        VStack(alignment: .leading, spacing: 15) {
            VStack {
                Text("Add Your Status")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.bannerFont)
            }
            
            // TexField.
            TextEditor(text: $statusField)
                .lineLimit(1)
//                .minimumScaleFactor(0.5)
                .font(.footnote)
                .padding(.horizontal)
                .frame(width: 350, height: 120)
                .background(
                    Color.bannerFont,
                    in: RoundedRectangle(cornerRadius: 24).stroke(lineWidth: 1.5)
                )
                .autocorrectionDisabled(true)
                .onChange(of: statusField) { _, newText in
                    if newText.count > charLimit {
                        statusField = String(newText.prefix(charLimit))
                    }
                    charCount = statusField.count
                }
            
            Text("\(charCount)/\(charLimit)")
                .frame(width: 350, height: 20, alignment: .trailing)
                .font(.footnote)
                .foregroundStyle(.bannerFont)
        }
        .frame(width: 350, height: 195)
    }
}

#Preview {
    RefineSectionView02()
}
