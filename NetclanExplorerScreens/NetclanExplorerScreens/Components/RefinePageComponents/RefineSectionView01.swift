//
//  RefineSectionView01.swift
//  NetclanExplorerScreens
//
//  Created by Laxman Singh Koranga on 10/07/2024.
//

import SwiftUI

struct RefineSectionView01: View {
    var dropDownOptions = [
        "Available | Hey Lets Connect",
        "Away | Stay Discreet And Watch",
        "Busy | Do Not Disturb | Will Catch Up Later",
        "SOS | Emergency! Need Assistance! HELP"
    ]
    @State private var selectedDropDown: String = "Available | Hey Lets Connect"
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Section01.
            VStack(alignment: .leading, spacing: 15) {
                VStack {
                    Text("Select Your Availability")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.bannerFont)
                }
                
                Menu(selectedDropDown) {
                    ForEach(dropDownOptions, id: \.self) { option in
                        Button(action: {
                            selectedDropDown = option
                        }, label: {
                            Text(option)
                        })
                    }
                }
                .font(.body)
                .foregroundStyle(.bannerFont)
                .padding(.horizontal)
                .frame(width: 350, height: 49, alignment: .leading)
                .background(RoundedRectangle(cornerRadius: 15).stroke(.bannerFont).fill(Color.white))
                .overlay(
                    GeometryReader { geo in
                        Image(.down)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 20, alignment: .trailing)
                            .offset(x: geo.size.width - 29, y: 15)
                    }
                )
            }
            .padding(.top, 35)
            .frame(width: 350, height: 130)
        }
    }
}

#Preview {
    RefineSectionView01()
}

