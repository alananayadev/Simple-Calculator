//
//  CalcViewModel.swift
//  Simple Calculator
//
//  Created by Alan Anaya Araujo on 11/08/23.
//

import Foundation
import SwiftUI

final class CalcViewModel: ObservableObject {
    @Published var resultBoardString: String {
        didSet {
            if let value: Float = Float(resultBoardString) {
                currentValue = value
            }
        }
    }
    @Published private var currentValue: Float
    @Published private var isDecimalInUse: Bool = false
    private var memoryValue: Float = 0.0
    private var currentOperator: Operator?
    private var resultIsShown: Bool = false
    private var reuseValue: Bool = false
    
    init() {
        resultBoardString = "0"
        currentValue = 0.0
    }
    
    func executeKeyFunction(_ key: KeyElement){
        switch key {
        case .c, .plusminus, .percentaje, .delete, .equal:
            functionTask(key)
        case .division, .multiply, .plus, .minus:
            operatorsTask(key)
        default:
            numberTask(key)
        }
    }
    
    private func functionTask(_ key: KeyElement) {
        switch key {
        case .c:
            resultBoardString = "0"
            memoryValue = 0.0
            isDecimalInUse = false
            reuseValue = false
            resultIsShown = false
            
        case .plusminus:
            if resultBoardString == "0" {
                return
            }
            
            if resultBoardString.first != "-" && resultBoardString != "0" {
                resultBoardString = "-\(resultBoardString)"
            } else {
                resultBoardString.removeFirst()
            }
            
        case .percentaje:
            var result = "0"
            
            guard let currentOperator = currentOperator else {
                resultBoardString = result
                return
            }
            
            switch currentOperator {
            case .sum:
                result = addPercentage()
            case .subtract:
                result = substractPercentage()
            case .multiply:
                result = multiplyPercentage()
            case .divide:
                result = divisionPercentage()
            }
            
            if result.suffix(2) == ".0" {
                result.removeLast(2)
            }
            
            if !reuseValue {
                memoryValue = currentValue
                reuseValue = true
            }
            
            resultIsShown = true
            isDecimalInUse = false
            resultBoardString = result
            
        case .delete:
            var tempInput: String = resultBoardString
            let charInput = tempInput.removeLast()
            
            if charInput == "." {
                isDecimalInUse = false
            }
            
            if !tempInput.isEmpty {
                resultBoardString = tempInput
            } else {
                resultBoardString = "0"
            }
            
        case .equal:
            var result = ""
            guard let currentOperator = currentOperator else { return }
            switch currentOperator {
            case .sum:
                result = addCalc()
            case .subtract:
                result = substractCalc()
            case .multiply:
                result = multiplyCalc()
            case .divide:
                result = divisionCalc()
            }
            if result.suffix(2) == ".0" {
                result.removeLast(2)
            }
            
            if !reuseValue {
                memoryValue = currentValue
                reuseValue = true
            }
            resultIsShown = true
            isDecimalInUse = false
            resultBoardString = result
            
        default:
            print("NOT IMPLEMENTED FUNCTION")
        }
    }
    
    private func operatorsTask(_ key: KeyElement) {
        memoryValue = currentValue
        
        switch key {
        case .division:
            currentOperator = .divide
        case .multiply:
            currentOperator = .multiply
        case .minus:
            currentOperator = .subtract
        case .plus:
            currentOperator = .sum
        default:
            print("NOT IMPLEMENTED OPERATOR")
        }
        
        resultIsShown = true
        isDecimalInUse = false
        reuseValue = false
    }
    
    private func numberTask(_ key: KeyElement) {
        if isDecimalInUse && key == .decimal {
            return
        } else if !isDecimalInUse && key == .decimal {
            isDecimalInUse = true
        }
        
        if resultIsShown || (resultBoardString == "0" && key != .decimal) {
            resultBoardString = key == .decimal ? "0." : key.rawValue
            resultIsShown = false
        } else {
            resultBoardString.append(key.rawValue)
        }
        reuseValue = false
    }
    
    // MARK: - Calculate Operations
    private func addCalc() -> String {
        return String(memoryValue + currentValue)
    }
    
    private func substractCalc() -> String {
        return reuseValue ? String(currentValue - memoryValue) : String(memoryValue - currentValue)
    }
    
    private func multiplyCalc() -> String {
        return String(memoryValue * currentValue)
    }
    
    private func divisionCalc() -> String {
        return reuseValue ? String(currentValue / memoryValue) : String(memoryValue / currentValue)
    }
    
    // MARK: - Percentage Operations
    private func addPercentage() -> String {
        let percentageValue = memoryValue * (currentValue / 100)
        
        return "\(memoryValue + percentageValue)"
    }
    
    private func substractPercentage() -> String {
        let percentageValue = memoryValue * (currentValue / 100)
        
        return "\(memoryValue - percentageValue)"
    }
    
    private func multiplyPercentage() -> String {
        let percentageValue = memoryValue * (currentValue / 100)
        
        return "\(percentageValue)"
    }
    
    private func divisionPercentage() -> String {
        let percentageValue = (memoryValue / currentValue) * 100
        
        return "\(percentageValue)"
    }
}
