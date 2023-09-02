//
//  ResultBoard.swift
//  Simple Calculator
//
//  Created by Alan Anaya Araujo on 10/08/23.
//

import SwiftUI

struct ResultBoard: View {
    @Binding var resultBoard: String
    var body: some View {
        Text(resultBoard)
            .font(.system(size: Constants.Board.fontSize, weight: .ultraLight, design: .monospaced))
            .foregroundColor(.black)
            .minimumScaleFactor(0.6)
            .lineLimit(1)
            .frame(maxWidth: .infinity, maxHeight: Constants.Board.height, alignment: .trailing)
            .padding(.horizontal, Constants.Board.horizontalPadding)
            .background(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(
                    .shadow(.inner(color: CalcColors.resultBoardUpperShadow,radius: 8, x:3, y: 3))
                    .shadow(.inner(color: CalcColors.resultBoardBottomShadow, radius: 8, x: -3, y: -3))
                )
                    .foregroundColor(CalcColors.resultBoard)
            )
            .padding(Constants.Board.horizontalPadding)
    }
}
