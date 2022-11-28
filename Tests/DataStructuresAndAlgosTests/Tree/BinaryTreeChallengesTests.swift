//
//  BinaryTreeChallengesTests.swift
//  
//
//  Created by Diogo Araújo on 29/11/2022.
//

import XCTest
@testable import DataStructuresAndAlgos

class BinaryTreeChallengesTests: XCTestCase {

    var stub: BinaryTreeChallenges!
    var tree: BinaryNode<Int>!

    override func setUp() {

        super.setUp()

        self.stub = BinaryTreeChallenges()
        self.tree = makeTree()
    }

    override func tearDown() {

        self.stub = nil
        self.tree = nil

        super.tearDown()
    }

    func testHeight() throws {

        let height = self.stub.height(of: self.tree)
        let expected = 2

        XCTAssertEqual(height, expected)
    }

    func testSerialize() throws {

        let serialized = self.stub.serialize(self.tree)
        let expected = [7, 1, 0, nil, nil, 5, nil, nil, 9, 8, nil, nil, nil]

        XCTAssertEqual(serialized, expected)
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
