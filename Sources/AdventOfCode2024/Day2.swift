//
//  Day2.swift
//  AdventOfCode2
//
//  Created by Kamaal M Farah on 11/28/20.
//

import Foundation
import AdventOfCode2

struct Day2: AdventOfCodeSolver {
    let day = 2
    let bundle: Bundle = .module

    func solvePart1(_ input: String?) async throws -> String {
        let input = try parseInput(input)

        return String(input)
    }

    func solvePart2(_ input: String?) async throws -> String {
        let input = try parseInput(input)

        return input
    }

    private func parseInput(_ input: String?) throws -> String {
        let input = if let input { input } else { try getInput() }

        return input
    }
}
