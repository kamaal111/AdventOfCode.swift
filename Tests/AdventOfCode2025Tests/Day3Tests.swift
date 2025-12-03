//
//  Day3Tests.swift
//  AdventOfCode2
//
//  Created by Kamaal M Farah on 12/03/20.
//

import Testing
@testable import AdventOfCode2025

private let day3 = Day3()

@Test func `Day 3 Part 1 Example 1`() async throws {
    let example = """
    987654321111111
    811111111111119
    234234234234278
    818181911112111
    """
    let solution = try await day3.solvePart1(example)

    #expect(solution == "357")
}

@Test func `Day 3 Part 1 Example 1 joltage 1`() async throws {
    let cases: [(bank: [Int], joltage: Int)] = [
        (bank: "987654321111111", joltage: 98),
        (bank: "811111111111119", joltage: 89),
        (bank: "234234234234278", joltage: 78),
        (bank: "818181911112111", joltage: 92),
    ].map { ($0.bank.split(separator: "").map(\.int!), $0.joltage) }
    for (bank, joltage) in cases {
        let result = day3.calculateJoltage(ofSize: 2)(bank)

        #expect(result == joltage)
    }
}

@Test func `Day 3 Part 1`() async throws {
    let solution = try await day3.solvePart1(nil)

    #expect(solution == "17095")
}

@Test(.disabled("Uncomplete"))
func `Day 3 Part 2 Example 1`() async throws {
    let example = """
    987654321111111
    811111111111119
    234234234234278
    818181911112111
    """
    let solution = try await day3.solvePart2(example)

    #expect(solution == "3121910778619")
}

@Test(.disabled("Uncomplete"))
func `Day 3 Part 2 Example 1 joltage 1`() async throws {
    let cases: [(bank: [Int], joltage: Int)] = [
        (bank: "987654321111111", joltage: 987654321111),
        (bank: "811111111111119", joltage: 811111111119),
        (bank: "234234234234278", joltage: 434234234278),
        (bank: "818181911112111", joltage: 888911112111),
    ].map { ($0.bank.split(separator: "").map(\.int!), $0.joltage) }
    for (bank, joltage) in cases {
        let result = day3.calculateJoltage(ofSize: 12)(bank)

        #expect(result == joltage)
    }
}

@Test(.disabled("Uncomplete"))
func `Day 3 Part 2`() async throws {
    let solution = try await day3.solvePart2(nil)

    #expect(solution == "")
}
