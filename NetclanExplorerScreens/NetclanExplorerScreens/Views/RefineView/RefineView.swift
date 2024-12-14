//
//  RefineView.swift
//  NetclanExplorerScreens
//
//  Created by Laxman Singh Koranga on 10/07/2024.
//

import SwiftUI

struct RefineView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                RefineSectionView01()
                
                RefineSectionView02()
                
                RefineSectionView03()
                
                RefineSectionView04()
            }
            .background(Color.white)
            .customNavigationBar(backgroundColor: .bannerTeal, titleColor: .white, translucent: false, title: "Refine")
        }
    }
}

#Preview {
    RefineView()
}
