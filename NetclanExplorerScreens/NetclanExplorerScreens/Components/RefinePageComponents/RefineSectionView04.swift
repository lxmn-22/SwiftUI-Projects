//
//  RefineSectionView04.swift
//  NetclanExplorerScreens
//
//  Created by Laxman Singh Koranga on 11/07/2024.
//

import SwiftUI

struct RefineSectionView04: View {
    var body: some View {
        // Heading-04
        VStack(spacing: 15) {
            VStack {
                Text("Select Purpose")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.bannerFont)
                    
            }
            .frame(width: 350, height: 50, alignment: .leading)
//            .frame(width: 350, height: 50)
            
            // Multiple clickable buttons.
            CapsuleButtonView()
            
            Spacer()
            
            VStack {
                // Submit Button.
                    Button(action: {
                        // button clicked.
                    }, label: {
                        Text("Save & Explore")
                            .frame(width: 220, height: 41)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .background(Capsule().fill(Color.bannerTeal))
                    })
                    .frame(alignment: .center)
    //                .frame(width: 350, height: 500)
            }
            .frame(height: 43, alignment: .top)
        }
        .frame(width: 375, height: 330)
    }
}

#Preview {
    RefineSectionView04()
}
