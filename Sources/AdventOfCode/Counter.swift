//
//  Counter.swift
//  AdventOfCode
//
//  Created by Kamaal M Farah on 11/27/25.
//

package struct Counter<T: Hashable> {
    let container: [T: Int]

    package init(_ array: [T]) {
        var container: [T: Int] = [:]
        for item in array {
            container[item, default: 0] += 1
        }
        self.container = container
    }

    package subscript(_ key: T) -> Int {
        container[key, default: 0]
    }
}
