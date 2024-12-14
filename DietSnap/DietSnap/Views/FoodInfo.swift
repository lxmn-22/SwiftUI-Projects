//
//  FoodInfo.swift
//  DietSnap
//
//  Created by Laxman Singh Koranga on 18/07/2024.
//

import SwiftUI

struct FoodInfo: View {
    let viewModel = FoodInfoViewModel()
    
    var body: some View {
        VStack {
            FoodInfoView()
                .ignoresSafeArea()
            
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    DescriptionView()
                        .padding(.bottom, 3)
                    
                    MacroNutrientsView()
                        .padding(.bottom, 3)
                    
                    FactsView()
                        .padding(.bottom)
                    
                    SimilarItemsView()
                }
            }
        }
        .task {
            await viewModel.fetchFoodInfo()
        }
    }
}

#Preview {
    FoodInfo()
}
