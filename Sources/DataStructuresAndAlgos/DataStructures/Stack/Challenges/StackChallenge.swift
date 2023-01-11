//
//  StackChallenge.swift
//  
//
//  Created by Diogo Araújo on 24/10/2022.
//

import Foundation

final class StackChallenges {}

/// Challenge 1: Reverse an Array
/// Create a function that uses a stack to print the contents of an array in reversed order.
extension StackChallenges {

    func reverse(_ array: [Int]) -> String {

        var result = ""
        var stack = Stack(array)

        while let value = stack.pop() {

            result += "\(value)"
        }

        return result
    }
}

/// Challenge 2: Balance the parentheses
/// Check for balanced parentheses. Given a string, check if there are ( and ) characters, and return true if the parentheses in the string are balanced.
///
/// For example:
///
/// h((e))llo(world)() // balanced parentheses
/// (hello world // unbalanced
extension StackChallenges {

    func balancedParenthesis(_ s: String) -> Bool {

        var stack = Stack<Character>()

        for char in s {

            if char == "(" {
                stack.push(char)
            } else if char == ")" {

                if stack.isEmpty {

                    return false

                } else {

                    stack.pop()
                }
            }
        }

        return stack.isEmpty
    }
}

extension StackChallenges {

    func evalRPN(_ tokens: [String]) -> Int {

        let operators = ["+", "-", "*", "/"]
        var stack: [String] = []
        var result = ""

        func isOperator(_ op: String) -> Bool {

            operators.contains(op)
        }

        for token in tokens {

            if isOperator(token) {

                if result.isEmpty {

                    let last = stack.removeLast()
                    let lastLast = stack.removeLast()

                    result += ( "(" + lastLast + token + last + ")")
                } else {

                    let last = stack.removeLast()

                    result = ("(" + last + token + result + ")")
                }

            } else {

                stack.append(token)
            }
        }

        let exp = NSExpression(format: result)

        return (exp.expressionValue(with: nil, context: nil) as? Int) ?? 0
    }
}
