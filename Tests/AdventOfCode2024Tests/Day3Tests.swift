//
//  Day3Tests.swift
//  AdventOfCode2
//
//  Created by Kamaal M Farah on 11/28/20.
//

import Testing
@testable import AdventOfCode2024

@MainActor
@Test
func `Day 3 Part 1 Example 1`() async throws {
    let day3 = Day3()
    let example = "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"
    let solution = try await day3.solvePart1(example)

    #expect(solution == "161")
}

@MainActor
@Test
func `Day 3 Part 1`() async throws {
    let day3 = Day3()
    let solution = try await day3.solvePart1(nil)

    #expect(solution == "166357705")
}

@MainActor
@Test
func `Day 3 Part 2 Example 1`() async throws {
    let day3 = Day3()
    let example = "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))"
    let solution = try await day3.solvePart2(example)

    #expect(solution == "48")
}

@MainActor
@Test
func `Day 3 Part 2`() async throws {
    let day3 = Day3()
    let solution = try await day3.solvePart2(nil)

    #expect(solution == "88811886")
}
