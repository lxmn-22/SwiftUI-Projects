//
//  CapsuleButtonView.swift
//  NetclanExplorerScreens
//
//  Created by Laxman Singh Koranga on 10/07/2024.
//

import SwiftUI

struct CapsuleButtonView: View {
    // Tracks the selected button, set default selected buttons.
    @State private var selectedButtons: [Int] = [0,1,3,4,6]
    let buttons = [
        "Coffee",
        "Business",
        "Hobbies",
        "Friendship",
        "Movies",
        "Dining",
        "Dating",
        "Matrimony"
    ]
    
    var body: some View {
        let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
        VStack(spacing: 20) {
            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(0..<buttons.count, id: \.self) { index in
                    Button(action: {
                        if selectedButtons.contains(index) {
                            selectedButtons.removeAll { $0 == index }
                        } else  {
                            selectedButtons.append(index)
                        }
                    }, label: {
                        Text(buttons[index])
                            .padding()
                            .frame(width: 125, height: 50)
                            .foregroundStyle(selectedButtons.contains(index) ? Color.white : Color.bannerFont)
                            .background(selectedButtons.contains(index)
                                        ? Capsule().fill(Color.bannerTeal).stroke(Color.bannerTeal)
                                        : Capsule().fill(Color.white).stroke(Color.bannerFont))
                        
                    })
                }
            }
        }
    }
}
#Preview {
    CapsuleButtonView()
}
