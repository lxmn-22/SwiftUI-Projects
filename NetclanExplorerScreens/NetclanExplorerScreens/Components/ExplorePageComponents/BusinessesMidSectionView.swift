//
//  BusinessesMidSectionView.swift
//  NetclanExplorerScreens
//
//  Created by Laxman Singh Koranga on 11/07/2024.
//

import SwiftUI

struct BusinessesMidSectionView: View {
    var body: some View {
        VStack {
            SearchBarView()
                .padding(.top, 30)
            
            Spacer(minLength: 10)
            
            VStack(spacing: 25) {
                // sorry for the image, i can't found the same.
                Image(.map)
                    .resizable()
                    .scaledToFit()
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .frame(width: 120, height: 90)
                
                HStack {
                    Text("Need your location")
                        .fontWeight(.semibold)
                        .foregroundStyle(.bannerTeal)
                }
                
                VStack {
                    Text("Sorry!! location permission is mandatory, Please allow")
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .dynamicTypeSize(.small)
                    Text("location permission!")
                        .dynamicTypeSize(.small)
                }
                .font(.footnote)
                .foregroundStyle(.bannerFont)
                
                Button(action: {
                    // Add functioning.
                }, label: {
                    Text("Allow")
                        .frame(width: 280, height: 45)
                        .foregroundStyle(.white)
                        .background(RoundedRectangle(cornerRadius: 24).fill(.bannerTeal))
                })
                
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
                .padding(.top, 35)
            }
        }
        .frame(width: 390, height: 500, alignment: .bottomTrailing)
    }
}

#Preview {
    BusinessesMidSectionView()
}
