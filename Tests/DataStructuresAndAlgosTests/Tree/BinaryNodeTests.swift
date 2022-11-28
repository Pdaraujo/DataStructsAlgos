//
//  BinaryNodeTests.swift
//  
//
//  Created by Diogo Araújo on 14/11/2022.
//

import XCTest
@testable import DataStructuresAndAlgos

final class BinaryNodeTests: XCTestCase {

    func testTraverseInOrder() throws {

        let tree = makeTree()

        let match = "015789"
        var result = ""
        tree.traverseInOrder(visit: { result += "\($0)" })

        XCTAssertEqual(match, result)
    }

    func testTraversePreOrder() throws {

        let tree = makeTree()

        let match = "710598"
        var result = ""
        tree.traversePreOrder(visit: { result += "\($0)" })

        XCTAssertEqual(match, result)
    }

    func testTraversePostOrder() throws {

        let tree = makeTree()

        let match = "051897"
        var result = ""
        tree.traversePostOrder(visit: { result += "\($0)" })

        XCTAssertEqual(match, result)
    }

    private func makeTree() -> BinaryNode<Int> {

        let tree: BinaryNode<Int> = {

            let zero = BinaryNode(value: 0)
            let one = BinaryNode(value: 1)
            let five = BinaryNode(value: 5)
            let seven = BinaryNode(value: 7)
            let eight = BinaryNode(value: 8)
            let nine = BinaryNode(value: 9)

            seven.leftChild = one
            one.leftChild = zero
            one.rightChild = five
            seven.rightChild = nine
            nine.leftChild = eight

            return seven
        }()

        return tree
    }
}
