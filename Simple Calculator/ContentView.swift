//
//  ContentView.swift
//  Simple Calculator
//
//  Created by Alan Anaya Araujo on 10/08/23.
//

//Comment

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel: CalcViewModel = CalcViewModel()
    
    private let calcColumns: [GridItem] = [
        GridItem(.flexible(minimum: 30), spacing: 0),
        GridItem(.flexible(minimum: 30), spacing: 0),
        GridItem(.flexible(minimum: 30), spacing: 0),
        GridItem(.flexible(minimum: 30), spacing: 0)
    ]
    
    var body: some View {
        VStack {
            resultBoard
            Spacer()
            LazyVGrid(columns: calcColumns, spacing: 20) {
                ForEach(KeyElement.allCases, id: \.id) { key in
                    CalcButton(
                        viewModel: viewModel,
                        element: key
                    )
                }
            }
            
            Spacer()
        }
        .background(
            LinearGradient(colors: CalcColors.main, startPoint: .topLeading, endPoint: .bottomTrailing)
                .shadow(
                    color: CalcColors.mainShadow, radius: 70, x: 0, y: 0
                )
        )
        .preferredColorScheme(ColorScheme.dark)
    }
    
    private var resultBoard: some View {
        ResultBoard(resultBoard: $viewModel.resultBoardString)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
