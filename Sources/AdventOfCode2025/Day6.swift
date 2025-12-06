//
//  Day6.swift
//  AdventOfCode
//
//  Created by Kamaal M Farah on 12/06/20.
//

import Foundation
import AdventOfCode
import KamaalExtensions

struct Day6: AdventOfCodeSolver {
    let day = 6
    let bundle: Bundle = .module

    func solvePart1(_ input: String?) async throws -> String {
        let (numberRows, operations) = parseInput(input)

        return operations.enumerated()
            .map { i, operation in
                var numbers: [Int] = []
                for numberRow in numberRows {
                    numbers.append(numberRow[i])
                }
                return Formula(numbers: numbers, operation: operation)
            }
            .reduce(0) { result, formula in result + formula.calculate() }
            .string
    }

    func solvePart2(_ input: String?) async throws -> String {
        let (numberRows, operations) = parseInput(input)

        return "0"
    }

    private func parseInput(_ input: String?) -> (numberRows: [[Int]], operations: [Operations]) {
        let input = input ?? getInput()

        let (numberRows, operations) = input.splitLines
            .reduce((numberRows: [[Int]](), operations: [Operations]())) { result, line in
                let splitten = line.split(whereSeparator: \.isWhitespace)
                let maybeNumbers = splitten.compactMap(\.int)
                if !maybeNumbers.isEmpty {
                    return (result.numberRows.appended(maybeNumbers), result.operations)
                }
                return (result.numberRows, splitten.map(Operations.fromStringSubsequence))
            }
        assert(!operations.isEmpty)
        assert(!numberRows.isEmpty)
        assert(operations.count == numberRows.first?.count)
        assert(numberRows.dropFirst().allSatisfy { $0.count == operations.count })

        return (numberRows, operations)
    }

    private struct Formula {
        let numbers: [Int]
        let operation: Operations

        func calculate() -> Int {
            let start = switch operation {
            case .addition: 0
            case .multiplication: 1
            }
            return numbers.reduce(start) { result, number in
                switch operation {
                case .addition: result + number
                case .multiplication: result * number
                }
            }
        }
    }

    private enum Operations: Character {
        case addition = "+"
        case multiplication = "*"

        static func fromStringSubsequence(_ subsequence: Substring.SubSequence) -> Self {
            let char = Character(String(subsequence))
            return Operations(rawValue: char)!
        }
    }
}
