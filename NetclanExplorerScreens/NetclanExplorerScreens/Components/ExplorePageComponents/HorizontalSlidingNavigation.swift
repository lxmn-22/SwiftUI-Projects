//
//  HorizontalSildingNavigation.swift
//  NetclanExplorerScreens
//
//  Created by Laxman Singh Koranga on 11/07/2024.
//

import SwiftUI

struct HorizontalSlidingNavigation: View {
    @State var currentTab: Int = 0
    
    var body: some View {
        ZStack(alignment: .top) {
            TabView(selection: self.$currentTab) {
                PersonalTabView().tag(0)
                ServicesTabView().tag(1)
                BusinessesTabView().tag(2)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
//            .ignoresSafeArea()
            
            TabBarView(currentTab: self.$currentTab)
        }
    }
}
struct TabBarView: View {
    @Binding var currentTab: Int
    @Namespace var namespace
    var tabBarOptions: [String] = [
        "Personal",
        "Services",
        "Businesses"
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 42) {
                ForEach(Array(zip(self.tabBarOptions.indices, self.tabBarOptions)),
                        id: \.0,
                        content: { index, name in
                    TabBarItem(
                        currentTab: self.$currentTab,
                        tab: index,
                        tabBarItemName: name,
                        namespace: namespace.self)
                    .frame(width: 90, height: 33)
                })
            }
        }
        .padding()
        .ignoresSafeArea(.all)
        .background(Color.bannerTeal)
        .frame(width: 395, height: 69)
    }
}

struct TabBarItem: View {
    @Binding var currentTab: Int
    var tab: Int
    var tabBarItemName: String
    let namespace: Namespace.ID
    
    var body: some View {
        Button {
            self.currentTab = tab
        } label: {
            VStack {
//                Spacer()
                Text(tabBarItemName)
                
                if currentTab == tab {
                    Color.white
                        .frame(height: 7)
                        .matchedGeometryEffect(id: "underline",
                                               in: namespace,
                                               properties: .frame)
                } else {
                    Color.clear.frame(height: 7)
                }
            }
            .animation(.spring(), value: self.currentTab)
        }
        .font(.headline)
        .foregroundStyle(.white)
    }
}
#Preview {
    HorizontalSlidingNavigation()
}
