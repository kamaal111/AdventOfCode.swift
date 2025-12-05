//
//  Day5.swift
//  AdventOfCode2
//
//  Created by Kamaal M Farah on 12/05/20.
//

import Foundation
import AdventOfCode2
import KamaalExtensions

struct Day5: AdventOfCodeSolver {
    let day = 5
    let bundle: Bundle = .module

    func solvePart1(_ input: String?) async throws -> String {
        let (ranges, ids) = parseInput(input)

        return ids.reduce(0) { result, id in
            let isFresh = ranges.contains { range in
                id >= range.left && id <= range.right
            }
            if isFresh {
                return result + 1
            }
            return result
        }
        .string
    }

    func solvePart2(_ input: String?) async throws -> String {
        let (ranges, ids) = parseInput(input)

        return ids.reduce(Set<Pair<Int>>()) { result, id in
            let freshRanges = ranges.filter { range in
                id >= range.left && id <= range.right
            }

            return result.union(freshRanges)
        }
        .reduce(Set<Int>()) { result, ids in
            return result.union(ids.closedRange)
        }
        .count
        .string
    }

    private func parseInput(_ input: String?) -> (ranges: [Pair<Int>], list: [Int]) {
        let input = input ?? getInput()

        return input.splitLines
            .reduce((ranges: [Pair<Int>](), list: [Int]())) { result, line in
                let trimmed = line.trimmingByWhitespacesAndNewLines
                guard !trimmed.isEmpty else { return result }

                if trimmed.contains("-") {
                    let ids = trimmed.split(separator: "-").map(\.int!)
                    assert(ids.count == 2)
                    return (result.ranges.appended(Pair(left: ids[0], right: ids[1])), result.list)
                }

                return (result.ranges, result.list.appended(trimmed.int!))
            }
    }
}
