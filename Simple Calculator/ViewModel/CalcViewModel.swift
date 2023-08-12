//
//  CalcViewModel.swift
//  Simple Calculator
//
//  Created by Alan Anaya Araujo on 11/08/23.
//

import Foundation
import SwiftUI

protocol CalcProtocol {
    func setButtonConfig(keyFunction: KeyFunction) -> ButtonType
}

final class CalcViewModel: CalcProtocol {
    func setButtonConfig(keyFunction: KeyFunction) -> ButtonType {
        var buttonType: ButtonType
        switch keyFunction {
        case .c:
            buttonType = ButtonType.functionDark
        case .plusminus, .percentaje:
            buttonType = ButtonType.functionLight
        case .division, .multiply, .minus, .plus:
            buttonType = ButtonType.operatorLight
        case .equal:
            buttonType = ButtonType.operatorDark
        default:
            buttonType = ButtonType.numbers
        }
        return buttonType
    }
}
