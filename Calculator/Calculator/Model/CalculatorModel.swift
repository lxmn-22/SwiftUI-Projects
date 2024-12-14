//
//  calculatorModel.swift
//  Calculator
//
//  Created by Laxman Singh Koranga on 16/10/2023.
//

import Foundation
import SwiftUI

enum Operation {
    case addition, subtraction, multiplication, division, equal, none
}

enum CalculatorButton: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case addition = "+"
    case subtraction = "-"
    case multiplication = "*"
    case division = "/"             // ÷
    case equal = "="
    case clear = "AC"
    case decimal = "."
    case percentage = "%"
    case negative = "IMGplus.forwardslash.minus"
}

let enumOperators: [CalculatorButton] = [
    .addition, .subtraction, .multiplication, .division
]

let multiplicationSymbol: String = CalculatorButton.multiplication.rawValue
let divisionSymbol: String = CalculatorButton.division.rawValue

let operators: String = "+/-\(multiplicationSymbol)\(divisionSymbol)"

struct CalculatorButtonModel: Identifiable {
    let id = UUID()
    let calculatorButton: CalculatorButton
    var color: Color = foregroundDigitsColor
}

struct RowOfCalculatorButtonModel: Identifiable {
    let id = UUID()
    let row: [CalculatorButtonModel]
}
