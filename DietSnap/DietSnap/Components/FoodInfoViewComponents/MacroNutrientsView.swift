//
//  MacroNutrientsView.swift
//  DietSnap
//
//  Created by Laxman Singh Koranga on 19/07/2024.
//

import SwiftUI

struct TableData: Identifiable {
    let id = UUID()
    let content: String
    let perServe: String
    let per250gm: String
}

struct MacroNutrientsView: View {
    @State private var data = [
        TableData(content: "Energy", perServe: "415 J", per250gm: "600 J"),
        TableData(content: "Protein", perServe: "2g", per250gm: "6g"),
        TableData(content: "Trans fat", perServe: "0.5", per250gm: "1g"),
        TableData(content: "Saturated Fat", perServe: "0.8g", per250gm: "0.8g"),
        TableData(content: "Carbohydrates", perServe: "3g", per250gm: "5.5g"),
        TableData(content: "Fibre", perServe: "4g", per250gm: "7.2g")
    ]
    
    var body: some View {
        VStack(spacing: 21) {
            HStack {
                Text("Macro Nutrients")
                    .font(.title)
                    .fontWeight(.bold)
            }
            .padding(.horizontal)
            .frame(width: 410, alignment: .leading)
            
            HStack {
                Text("")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Per Serve")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .center)
                Text("Per 250gm")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            .padding(.horizontal)
            
            List(data) { item in
                HStack {
                    Text(item.content)
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(item.perServe)
                        .frame(maxWidth: .infinity, alignment: .center)
                    Text(item.per250gm)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
        }
        .frame(width: 390, height: 425)
    }
}

#Preview {
    MacroNutrientsView()
}
