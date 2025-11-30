//
//  AdventOfCodeSolver.swift
//  AdventOfCode2
//
//  Created by Kamaal M Farah on 11/26/25.
//

import Foundation

package protocol AdventOfCodeSolver: Sendable {
    var day: Int { get }
    var bundle: Bundle { get }

    func solvePart1(_ input: String?) async throws -> String
    func solvePart2(_ input: String?) async throws -> String
}

extension AdventOfCodeSolver {
    package func getInput() -> String {
        let url = bundle.url(forResource: "day\(day)", withExtension: "txt")!
        return try! String(contentsOf: url)
    }
}
