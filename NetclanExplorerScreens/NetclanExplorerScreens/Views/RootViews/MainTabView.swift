//
//  TabView.swift
//  NetclanExplorerScreens
//
//  Created by Laxman Singh Koranga on 10/07/2024.
//

import SwiftUI

struct MainTabView: View {
    @State private var  selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ExploreView()
                .tabItem {
                    Label("Explore", 
                          systemImage: "eye")
                }
                .tag(0)
                
            ConnectionView()
                .tabItem {
                    Label("Connections", 
                          systemImage: "person.3")
                }
                .tag(1)
            ChatView()
                .tabItem {
                    Label("Chat",
                          systemImage: "message")
                }
                .tag(2)
            ContactView()
                .tabItem {
                    
                    Label("Contacts", 
                          systemImage: "book.closed")
                }
                .tag(3)
            GroupView()
                .tabItem { Label("Groups", 
                                 systemImage: "number")
                }
                .tag(4)
        }
    }
}

#Preview {
    MainTabView()
}
