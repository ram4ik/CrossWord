//
//  CrosswordView.swift
//  CrossWord
//
//  Created by ramil on 19.04.2021.
//

import SwiftUI

func generateRepaetStringArray(size: Int, string: String) -> [String] {
    var array = [String]()
    
    for _ in 0..<size {
        array.append(string)
    }
    
    return array
}

struct CrosswordView: View {
    @State var blockText = generateRepaetStringArray(size: 6, string: " ")
    @State var selectedIndex = 0
    
    var selectedBinding: Binding<String> {
        Binding<String>(
            get: {
                blockText[selectedIndex]
            },
            set: {
                blockText[selectedIndex] = $0
            }
        )
    }
    
    var body: some View {
        ZStack {
            CrosswordKeyboard(text: selectedBinding)
            
            VStack {
                ZStack {
                    createBlock(0)
                    createBlock(5, tip: 1)
                }
                HStack {
                    createBlock(1, tip: 2)
                    createBlock(2)
                    createBlock(3)
                }
                createBlock(4)
                
                Group {
                Text("1. Type of vehicle")
                    .padding()
                Text("2. Type of animal")
                    .padding()
                }.padding()
            }
        }
    }
    
    func textBind(index: Int) -> Binding<String> {
        Binding<String>(
            get: {
                blockText[index]
            },
            set: {
                blockText[index] = $0
            }
        )
    }
    
    func createBlock(_ index: Int, tip: Int = -1) -> CrosswordBlockView {
        CrosswordBlockView(index: index, tip: tip, selectedIndex: $selectedIndex, text: textBind(index: index))
    }
}

struct CrosswordView_Previews: PreviewProvider {
    static var previews: some View {
        CrosswordView()
    }
}
