//
//  Constants.swift
//  Simple Calculator
//
//  Created by Alan Anaya Araujo on 10/08/23.
//

import Foundation

struct Constants {
    struct Board {
        static var fontSize: CGFloat = 90
        static var height: CGFloat = 183
        static var horizontalPadding: CGFloat = 24
    }
    
    struct CalcButton {
        static var width: CGFloat = 160.0
        static var height: CGFloat = 160.0
        static var fontSize: CGFloat = 100.0
    }
}

enum KeyFunction: String, CaseIterable, Identifiable {
    var id: String { return self.rawValue }
    case c = "C"
    case plusminus = "+-"
    case percentaje = "%"
    case division = "/"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case multiply = "*"
    case four = "4"
    case five = "5"
    case six = "6"
    case minus = "-"
    case one = "1"
    case two = "2"
    case three = "3"
    case plus = "+"
    case decimal = "."
    case zero = "0"
    case delete = "<-"
    case equal = "="
}
