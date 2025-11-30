//
//  Matrix.swift
//  AdventOfCode2
//
//  Created by Kamaal M Farah on 11/29/25.
//

package struct Matrix<T: Hashable>: Sequence, CustomStringConvertible {
    private let elements: [[Element]]

    package var description: String {
        elements.map { row in row.map { "\($0.value)" }.joined() }.joined(separator: "\n")
    }

    package init(elements: [[Element]]) {
        assert(elements.dropFirst().allSatisfy { $0.count == elements.first?.count ?? 0 })
        self.elements = elements
    }

    package var height: Int {
        elements.count
    }

    package var width: Int {
        elements.first?.count ?? 0
    }

    package subscript(row: Int, column: Int) -> Element? {
        return get(row: row, column: column)
    }

    package func get(row: Int, column: Int) -> Element? {
        guard row >= 0 else { return nil }
        guard row < height else { return nil }
        guard column >= 0 else { return nil }
        guard column < width else { return nil }

        return elements[row][column]
    }

    package func getVertical(row: Int, column: Int, includingGiven: Bool = false, maxDistance: Int = 1) -> [Element] {
        traverse(
            row: row,
            column: column,
            rowDelta: 1,
            columnDelta: 0,
            includingGiven: includingGiven,
            maxDistance: maxDistance
        )
    }

    package func getVertical(of element: Element, includingGiven: Bool = false, maxDistance: Int = 1) -> [Element] {
        getVertical(row: element.row, column: element.column, includingGiven: includingGiven, maxDistance: maxDistance)
    }

    package func getHorizontal(row: Int, column: Int, includingGiven: Bool = false, maxDistance: Int = 1) -> [Element] {
        traverse(
            row: row,
            column: column,
            rowDelta: 0,
            columnDelta: 1,
            includingGiven: includingGiven,
            maxDistance: maxDistance
        )
    }

    package func getHorizontal(of element: Element, includingGiven: Bool = false, maxDistance: Int = 1) -> [Element] {
        getHorizontal(
            row: element.row,
            column: element.column,
            includingGiven: includingGiven,
            maxDistance: maxDistance
        )
    }

    package func getTopLeftToBottomRight(
        row: Int,
        column: Int,
        includingGiven: Bool = false,
        maxDistance: Int = 1
    ) -> [Element] {
        traverse(
            row: row,
            column: column,
            rowDelta: 1,
            columnDelta: 1,
            includingGiven: includingGiven,
            maxDistance: maxDistance
        )
    }

    package func getTopLeftToBottomRight(
        of element: Element,
        includingGiven: Bool = false,
        maxDistance: Int = 1
    ) -> [Element] {
        getTopLeftToBottomRight(
            row: element.row,
            column: element.column,
            includingGiven: includingGiven,
            maxDistance: maxDistance
        )
    }

    package func getTopRightToBottomLeft(
        row: Int,
        column: Int,
        includingGiven: Bool = false,
        maxDistance: Int = 1
    ) -> [Element] {
        traverse(
            row: row,
            column: column,
            rowDelta: 1,
            columnDelta: -1,
            includingGiven: includingGiven,
            maxDistance: maxDistance
        )
    }

    package func getTopRightToBottomLeft(
        of element: Element,
        includingGiven: Bool = false,
        maxDistance: Int = 1
    ) -> [Element] {
        getTopRightToBottomLeft(
            row: element.row,
            column: element.column,
            includingGiven: includingGiven,
            maxDistance: maxDistance
        )
    }

    package func flatArray() -> [Element] {
        elements.flatMap { $0 }
    }

    package func makeIterator() -> IndexingIterator<[Element]> {
        flatArray().makeIterator()
    }

    package struct Element: Hashable {
        package let value: T
        package let row: Int
        package let column: Int

        package init(value: T, row: Int, column: Int) {
            self.value = value
            self.row = row
            self.column = column
        }
    }

    package static func fromString(_ string: String) -> Matrix<T> where T == Character {
        let elements = string.split(whereSeparator: \.isNewline)
            .enumerated().map { x, line in
                line.enumerated()
                    .map { y, value in Element(value: value, row: x, column: y) }
            }

        return Matrix(elements: elements)
    }

    private func traverse(
        row: Int,
        column: Int,
        rowDelta: Int,
        columnDelta: Int,
        includingGiven: Bool,
        maxDistance: Int
    ) -> [Element] {
        guard maxDistance > 0 else { return [] }

        let elements = (0...maxDistance).compactMap { i -> Element? in
            guard i != 0 || includingGiven else { return nil }
            return get(row: row + i * rowDelta, column: column + i * columnDelta)
        }
        assert(elements.count <= (maxDistance + (includingGiven ? 1 : 0)))

        return elements
    }
}
