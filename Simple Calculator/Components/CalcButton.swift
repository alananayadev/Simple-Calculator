//
//  CalcButton.swift
//  Simple Calculator
//
//  Created by Alan Anaya Araujo on 10/08/23.
//

import SwiftUI

struct CalcButton: View {
    var body: some View {
        Button {
            print("")
        } label: {
            Text("C")
                .font(Font.custom("Inter", size: 100).weight(.bold))
                .foregroundColor(.white)
                .background(RoundedRectangle(cornerRadius: 30)
                    .fill(.shadow(.drop(color: CalcColors.commonShadow,radius: 6, x: 4, y: 4))
                        .shadow(.drop(color: CalcColors.functionDarkShadow,radius: 4, x: -2, y: -2)))
                    .frame(width: Constants.CalcButton.width, height: Constants.CalcButton.height)
                    .foregroundStyle(LinearGradient(colors: CalcColors.functionDark, startPoint: .topLeading, endPoint: .bottomTrailing)))
        }
        .frame(width: Constants.CalcButton.width, height: Constants.CalcButton.height)
    }
}

struct CalcButton_Previews: PreviewProvider {
    static var previews: some View {
        CalcButton()
    }
}
