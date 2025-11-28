//
//  Day1Tests.swift
//  AdventOfCode2
//
//  Created by Kamaal M Farah on 11/26/25.
//

import Testing
@testable import AdventOfCode2024

private let day1 = Day1()

@Test func `Day 1 Part 1 Example 1`() async throws {
    let example = """
    3   4
    4   3
    2   5
    1   3
    3   9
    3   3
    """
    let solution = try await day1.solvePart1(example)

    #expect(solution == "11")
}

@Test func `Day 1 Part 1`() async throws {
    let solution = try await day1.solvePart1(nil)

    #expect(solution == "1882714")
}

@Test func `Day 1 Part 2 Example 1`() async throws {
    let example = """
    3   4
    4   3
    2   5
    1   3
    3   9
    3   3
    """
    let solution = try await day1.solvePart2(example)

    #expect(solution == "31")
}

@Test func `Day 1 Part 2`() async throws {
    let solution = try await day1.solvePart2(nil)

    #expect(solution == "19437052")
}
