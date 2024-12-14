//
//  ExploreView.swift
//  NetclanExplorerScreens
//
//  Created by Laxman Singh Koranga on 10/07/2024.
//

import SwiftUI

struct CustomNavigationBar: ViewModifier {
    @Environment(\.presentationMode) var presentationMode
    
    var backgroundColor: UIColor
    var titleColor: UIColor
    var translucent: Bool
    var title: String
    
    init(backgroundColor: UIColor, titleColor: UIColor, translucent: Bool, title: String) {
        self.backgroundColor = backgroundColor
        self.titleColor = titleColor
        self.translucent = translucent
        self.title = title
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = backgroundColor.withAlphaComponent(translucent ? 0.5 : 1.0)
        appearance.titleTextAttributes = [.foregroundColor : titleColor]
        appearance.largeTitleTextAttributes = [.foregroundColor: titleColor]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    func body(content: Content) -> some View {
        ZStack {
            content
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: HStack {
                    backButton
                    // push the title to left side.
                    Spacer()
                    Text(title)
                        .foregroundStyle(Color(titleColor))
                        .font(.headline)
                        .fontWeight(.bold)
                        .lineLimit(1)
                    // push the title to the left.
                    Spacer()
                })
            VStack {
                Spacer()
                Color.clear
                    .frame(height: 0)
            }
        }
//            .background(Color(backgroundColor.withAlphaComponent(translucent ? 0.5 : 1.0)).ignoresSafeArea())
    }
    
    private var backButton: some View {
        Button(action:  {
            // custom back action, if needed.
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "chevron.left")
                .foregroundStyle(.white)
        })
    }
}

extension View {
    func customNavigationBar(backgroundColor: UIColor, titleColor: UIColor = .white, translucent: Bool = false, title: String) -> some View {
        self.modifier(CustomNavigationBar(backgroundColor: backgroundColor, titleColor: titleColor, translucent: translucent, title: title))
    }
}

struct ExploreView: View {
    var body: some View {
        NavigationStack {
            HeaderSectionExploreView()
            
            HorizontalSlidingNavigation()
        }
    }
}

#Preview {
    ExploreView()
}
