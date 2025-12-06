//
//  Day6Tests.swift
//  AdventOfCode
//
//  Created by Kamaal M Farah on 12/06/20.
//

import Testing
import KamaalExtensions
@testable import AdventOfCode2025

private let day6 = Day6()

@Test func `Day 6 Part 1 Example 1`() async throws {
    let example = """
    123 328  51 64 
     45 64  387 23 
      6 98  215 314
    *   +   *   +  
    """

    let solution = try await day6.solvePart1(example).int

    #expect(solution == 4_277_556)
}

@Test func `Day 6 Part 1`() async throws {
    let solution = try await day6.solvePart1(nil).int

    #expect(solution == 7_644_505_810_277)
}

@Test func `Day 6 Part 2 Example 1`() async throws {
    let example = """
    123 328  51 64 
     45 64  387 23 
      6 98  215 314
    *   +   *   +  
    """

    let solution = try await day6.solvePart2(example).int

    #expect(solution == 3_263_827)
}

@Test func `Day 6 Part 2`() async throws {
    let solution = try await day6.solvePart2(nil).int

    #expect(solution == 0)
}
