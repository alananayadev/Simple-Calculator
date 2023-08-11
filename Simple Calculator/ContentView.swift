//
//  ContentView.swift
//  Simple Calculator
//
//  Created by Alan Anaya Araujo on 10/08/23.
//

import SwiftUI

struct ContentView: View {
    private let calcColumns: [GridItem] = [GridItem(.flexible(minimum: 30), spacing: 0), GridItem(.flexible(minimum: 30), spacing: 0), GridItem(.flexible(minimum: 30), spacing: 0), GridItem(.flexible(minimum: 30), spacing: 0)]
    var body: some View {
        VStack {
            resultBoard
            Spacer()
            LazyVGrid(columns: calcColumns, spacing: 20) {
                ForEach(0..<20) { _ in
                    CalcButton()
                }
            }
            
            Spacer()
        }
        .background(LinearGradient(colors: CalcColors.main, startPoint: .bottomLeading, endPoint: .topTrailing))
    }
    
    private var resultBoard: some View {
        ResultBoard()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
