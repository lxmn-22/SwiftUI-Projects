//
//  ExploreMidSectionView.swift
//  NetclanExplorerScreens
//
//  Created by Laxman Singh Koranga on 11/07/2024.
//

import SwiftUI

struct ExploreMidSectionView: View {
    var body: some View {
        VStack {
            SearchBarView()
                .padding(.top, 50)
            
            Spacer(minLength: 10)
            
            VStack(spacing: 25) {
                // sorry for the image, i can't found the same.
                Image(.person)
                    .resizable()
                    .scaledToFit()
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .frame(width: 120, height: 90)
                
                HStack {
                    Text("Your explore list is")
                        .fontWeight(.semibold)
                        .foregroundStyle(.bannerTeal)
                    
                    Text("EMPTY")
                        .font(.title3)
                        .foregroundStyle(.bannerYellow)
                }
                
                VStack {
                    Text("Sorry, we could not found any user near you. Try increasing your")
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .dynamicTypeSize(.small)
                    Text("search results.")
                        .dynamicTypeSize(.small)
                }
                .font(.footnote)
                .foregroundStyle(.bannerFont)
                
                Button(action: {
                    // Add functioning.
                }, label: {
                    Text("INCREASE RADIUS")
                        .frame(width: 280, height: 45)
                        .foregroundStyle(.white)
                        .background(RoundedRectangle(cornerRadius: 24).fill(.bannerTeal))
                })
            }
            VStack {
                Button(action: {
                    // Functioning.
                    print("Add button tapped")
                }, label: {
                    Image(systemName: "plus")
                        .scaleEffect(2)
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                        .padding(20)
                        .background(Circle().fill(.bannerTeal))
                })
                .frame(width: 345, alignment: .bottomTrailing)
                .padding(.top, 60)
            }
        }
        .frame(width: 390, height: 560)
    }
}

#Preview {
    ExploreMidSectionView()
}
