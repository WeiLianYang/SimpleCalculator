//
//  CalculatorCore.swift
//  SimpleCalculator
//
//  Created by WilliamYang on 2022/1/28.
//

import UIKit

class CalculatorCore: NSObject {

    let functionArray: CharacterSet = ["+", "-", "*", "/", "^", "%"]
    
    func calculate(equation: String) -> Double {
        // 以运算符为分割获取到所有数字
        let elementArray = equation.components(separatedBy: functionArray)
        print(elementArray)
        guard elementArray.count > 1 else {
            return 0
        }
        // 运算标记
        var tag = 0
        // 运算结果
        var result: Double = Double(elementArray[0])!
        // 遍历表达式
        for char in equation {
            switch char {
            case "+":
                // 加法
                tag += 1
                if elementArray.count > tag {
                    result += Double(elementArray[tag])!
                }
            case "-":
                // 减法
                tag += 1
                if elementArray.count > tag {
                    result -= Double(elementArray[tag])!
                }
            case "*":
                // 乘法
                tag += 1
                if elementArray.count > tag {
                    result *= Double(elementArray[tag])!
                }
            case "/":
                // 除法
                tag += 1
                if elementArray.count > tag {
                    result /= Double(elementArray[tag])!
                }
            case "%":
                // 取余
                tag += 1
                if elementArray.count > tag {
                    result = Double(Int(result) % Int(elementArray[tag])!)
                }
            case "^":
                // 指数
                tag += 1
                if elementArray.count > tag {
                    let temp = result
                    for _ in 1 ..< Int(elementArray[tag])! {
                        result *= temp
                    }
                }
            default:
                break
            }
        }
        return result
    }
}
