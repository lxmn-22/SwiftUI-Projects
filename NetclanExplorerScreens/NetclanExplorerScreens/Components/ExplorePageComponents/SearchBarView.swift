//
//  SearchBarView.swift
//  NetclanExplorerScreens
//
//  Created by Laxman Singh Koranga on 10/07/2024.
//

import SwiftUI

struct SearchBarView: View {
    @State private var text: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                HStack {
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                        .foregroundStyle(.bannerFont)
                    
                    VStack {
                        TextField("Search", text: $text)
                            .font(.title3)
                            .foregroundStyle(.gray)
                            .frame(width: 250, height: 39, alignment: .leading)
                    }
                }
                .frame(width: 320, height: 40)
                .background(RoundedRectangle(cornerRadius: 15).stroke(.bannerFont))
                
    //            Spacer()

                Button(action: {
                    // filter feature.
                }, label: {
                    Image(.filter)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                })
                
                Spacer()
            }
        }
    }
}

#Preview {
    SearchBarView()
}
