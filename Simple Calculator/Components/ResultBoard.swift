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
                    .shadow(color: CalcColors.resultBoardUpperShadow,radius: 8, x:3, y: 3)
                    .shadow(color: CalcColors.resultBoardBottomShadow, radius: 8, x: -3, y: -3)
                    .foregroundColor(CalcColors.resultBoard)
            )
            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color(red: 0/255, green: 0/255, blue: 0/255),
                                            lineWidth: 0.01)
                                    .shadow(color: CalcColors.resultBoardBottomShadow,
                                            radius: 3, x: 5, y: 5)
                                    .clipShape(
                                        RoundedRectangle(cornerRadius: 15)
                                    )
                                    .shadow(color: CalcColors.resultBoardUpperShadow, radius: 2, x: -2, y: -2)
                                    .clipShape(
                                        RoundedRectangle(cornerRadius: 15)
                                    )
                            )
            .padding(Constants.Board.horizontalPadding)
    }
}
