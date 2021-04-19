//
//  CrosswordBlockView.swift
//  CrossWord
//
//  Created by ramil on 19.04.2021.
//

import SwiftUI

struct CrosswordBlockView: View {
    var index: Int
    var tip = -1
    
    @Binding var selectedIndex: Int
    @Binding var text: String
    
    var body: some View {
        VStack {
            HStack {
                Text(tip == -1 ? " " : String(tip))
                    .font(.caption)
                    .position()
                
                Spacer()
            }
            Text(text)
                .font(.title)
                .fontWeight(.bold)
        }
        .padding()
        .foregroundColor(.white)
        .frame(width: 60, height: 60)
        .background(selectedIndex == index ? Color.blue : Color.orange)
        .cornerRadius(20)
        .onTapGesture {
            withAnimation {
                selectedIndex = index
            }
        }
    }
}
