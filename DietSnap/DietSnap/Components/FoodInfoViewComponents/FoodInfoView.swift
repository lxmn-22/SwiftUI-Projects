//
//  FoodInfoView.swift
//  DietSnap
//
//  Created by Laxman Singh Koranga on 19/07/2024.
//

import SwiftUI

struct FoodInfoView: View {
    var body: some View {
        ZStack{
            // Section 01.
            VStack {
                Image(.chicken)
                    .resizable()
                    .scaledToFit()
            }
            
            // Section 02.
            HStack {
                VStack(alignment: .leading) {
                    Text("Food Information")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.strongWhite)
                    Text("Fried Chicken")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.strongWhite)
                }
                .frame(width: 400, height: 310, alignment: .bottomLeading)
            }
            
            // Section 03.
            HStack {
                GlassCardView()
            }
        }
    }
}

#Preview {
    FoodInfoView()
}
