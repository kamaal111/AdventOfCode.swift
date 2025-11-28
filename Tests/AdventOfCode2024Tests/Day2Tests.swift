//
//  Day2Tests.swift
//  AdventOfCode2
//
//  Created by Kamaal M Farah on 11/28/20.
//

import Testing
@testable import AdventOfCode2024

private let day2 = Day2()

@Test func `Day 2 Part 1 Example 1`() async throws {
    let example = ""
    let solution = try await day2.solvePart1(example)

    #expect(solution == "")
}

@Test func `Day 2 Part 1`() async throws {
    let solution = try await day2.solvePart1(nil)

    #expect(solution == "")
}

@Test func `Day 2 Part 2 Example 1`() async throws {
    let example = ""
    let solution = try await day2.solvePart2(example)

    #expect(solution == "")
}

@Test func `Day 2 Part 2`() async throws {
    let solution = try await day2.solvePart2(nil)

    #expect(solution == "")
}
