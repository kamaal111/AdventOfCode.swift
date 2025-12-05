//
//  Day1.swift
//  AdventOfCode
//
//  Created by Kamaal M Farah on 11/26/25.
//

import AdventOfCode
import Foundation

struct Day1: AdventOfCodeSolver {
    let day = 1
    let bundle: Bundle = .module

    func solvePart1(_ input: String?) async throws -> String {
        let input = parseInput(input)
        let rights = input.right.sorted()
        let distances = input.left.sorted()
            .enumerated()
            .reduce(0) { result, enumeratedNumber in
                let (index, number) = enumeratedNumber
                let rightNumber = rights[index]
                return result + abs(number - rightNumber)
            }

        return String(distances)
    }

    func solvePart2(_ input: String?) async throws -> String {
        let input = parseInput(input)
        let rightCounts = Counter(input.right)
        let similarity = input.left.reduce(0) { result, number in
            result + (number * rightCounts[number])
        }

        return String(similarity)
    }

    private func parseInput(_ input: String?) -> Pair<[Int]> {
        let input = input ?? getInput()
        var lefts: [Int] = []
        var rights: [Int] = []
        for line in input.split(whereSeparator: \.isNewline) {
            let numbers = line.split(whereSeparator: \.isWhitespace).map { Int($0)! }
            assert(numbers.count == 2)

            lefts.append(numbers[0])
            rights.append(numbers[1])
        }

        return Pair(left: lefts, right: rights)
    }
}
