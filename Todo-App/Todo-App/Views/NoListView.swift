//
//  NoListView.swift
//  Todo-App
//
//  Created by Laxman Singh Koranga on 18/02/2024.
//

import SwiftUI

struct NoListView: View {
    @State var animate: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.bold)
                    .fontDesign(.serif)
                Text("Be more productive!!!")
                    .font(.subheadline)
                    .fontDesign(.serif)
                    .padding(.bottom, 20)
                NavigationLink(destination: AddView(), label: {
                    Text("Add something... 🙂")
                        .foregroundStyle(.black)
                        .font(.headline)
                        .fontDesign(.serif)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Color("NewColor") : Color.accentColor)
                        .cornerRadius(18)
                }).padding(.horizontal, animate ? 30 : 50 )
                    .shadow(color: animate ? Color("NewColor").opacity(0.7) : Color.accentColor.opacity(0.7), radius: animate ? 30 : 50, x: 0, y: animate ? 50 : 30)
                    .offset(y: animate ? -7 : 0)
            }.multilineTextAlignment(.center)
                .padding(40)
                .onAppear(perform: addAnimation)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else { return }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(Animation
                .easeInOut(duration: 2.0)
                .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

#Preview {
    NoListView()
}
