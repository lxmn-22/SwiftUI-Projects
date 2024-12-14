//
//  HeaderSectionExploreView.swift
//  NetclanExplorerScreens
//
//  Created by Laxman Singh Koranga on 12/07/2024.
//

import SwiftUI

struct HeaderSectionExploreView: View {
    var body: some View {
        HStack {
            Button(action: {
                // add navigation button view.
            }, label: {
                Image(systemName: "line.3.horizontal")
            })
            
            Spacer()
            
            // NavigationLink will help us to navigate through to RefineView().
            VStack(spacing: 7) {
                NavigationLink(destination: RefineView()) {
                    Image(systemName: "checklist")
                }
                
                VStack {
                    Text("Refine")
                        .font(.subheadline)
                }
            }
        }
        .padding()
        .frame(width: 395, height: 70)
        .font(.title)
        .foregroundStyle(.white)
        .background(.bannerTeal)
        .overlay {
            VStack(alignment: .leading, spacing: 6) {
                VStack {
                    Text("Howdy Laxman Koranga!!")
                        .fontWeight(.semibold)
                }
                
                VStack(spacing: 3) {
                    HStack(spacing: 3) {
                        Image(.location)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 25)
                        Text("location")
                    }
                }
            }
            .frame(width: 250, alignment: .leading)
            .font(.caption)
            .foregroundStyle(.white)
        }
    }
}

#Preview {
    HeaderSectionExploreView()
}
