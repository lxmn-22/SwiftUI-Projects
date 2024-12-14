//
//  GlassCardView.swift
//  DietSnap
//
//  Created by Laxman Singh Koranga on 19/07/2024.
//

import SwiftUI

struct GlassCardView: View {
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 21)
                    .fill(Color.glass)
        
                VStack(spacing: 15) {
                    Text("71")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(.strongWhite)

                    Text("out of 100")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundStyle(.strongWhite)
                }
            }
            .frame(width: 87, height: 80)
        }
        .frame(width: 360, height: 330, alignment: .bottomTrailing)
    }
}

#Preview {
    GlassCardView()
}
