//
//  CalcButton.swift
//  Simple Calculator
//
//  Created by Alan Anaya Araujo on 10/08/23.
//

import SwiftUI

struct CalcButton: View {
    let element: KeyFunction
    private var buttonColor: (shadow: Color, color: [Color])?
    private var fontColor: Color?
    private var icon: Image?
    
    init(buttonType: ButtonType, element: KeyFunction) {
        self.element = element
        setUpButtonElement(buttonType: buttonType)
    }
    
    private mutating func setUpButtonElement(buttonType: ButtonType) {
        switch buttonType {
        case .functionDark:
            buttonColor = (shadow: CalcColors.functionDarkShadow, color: CalcColors.functionDark)
            fontColor = .white
        
        case .functionLight:
            buttonColor = (shadow: CalcColors.functionLightShadow, color: CalcColors.functionLight)
            fontColor = CalcColors.functionColor
        
        case .operatorDark:
            buttonColor = (shadow: CalcColors.operatorDarkShadow, color: CalcColors.operatorDark)
            fontColor = .white
        
        case .operatorLight:
            buttonColor = (shadow: CalcColors.operatorLightShadow, color: CalcColors.operatorLight)
            fontColor = CalcColors.operatorColor
        
        case .numbers:
            buttonColor = (shadow: CalcColors.numbersShadow, color: CalcColors.numbers)
            fontColor = CalcColors.numberColor
        }
    }
    
    var body: some View {
        Button {
            print("")
        } label: {
            buttonContent
                .font(Font.custom("Inter", size: 100).weight(.bold))
                .foregroundColor(fontColor)
                .background(RoundedRectangle(cornerRadius: 30)
                    .fill(.shadow(.drop(color: CalcColors.commonShadow,radius: 6, x: 4, y: 4))
                        .shadow(.drop(color: buttonColor?.shadow ?? CalcColors.commonShadow, radius: 4, x: -2, y: -2)))
                    .frame(width: Constants.CalcButton.width, height: Constants.CalcButton.height)
                    .foregroundStyle(LinearGradient(colors: buttonColor?.color ?? CalcColors.numbers, startPoint: .topLeading, endPoint: .bottomTrailing)))
        }
        .frame(width: Constants.CalcButton.width, height: Constants.CalcButton.height)
    }
    
    private var buttonContent: some View {
        switch element {
        case .plusminus:
            return AnyView(Image(systemName: "plus.forwardslash.minus"))
        case .percentaje:
            return AnyView(Image(systemName: "percent"))
        case .division:
            return AnyView(Image(systemName: "divide"))
        case .multiply:
            return AnyView(Image(systemName: "multiply"))
        case .minus:
            return AnyView(Image(systemName: "minus"))
        case .plus:
            return AnyView(Image(systemName: "plus"))
        case .delete:
            return AnyView(Image(systemName: "delete.left.fill"))
        case .equal:
            return AnyView(Image(systemName: "equal"))
        default:
            return AnyView(Text(element.rawValue))
        }
    }
    
}

struct CalcButton_Previews: PreviewProvider {
    static var previews: some View {
        CalcButton(buttonType: .numbers, element: KeyFunction.c)
    }
}
