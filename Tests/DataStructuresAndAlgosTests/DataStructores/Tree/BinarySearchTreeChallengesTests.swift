//
//  BinarySearchTreeChallengesTests.swift
//  
//
//  Created by Diogo Araújo on 06/12/2022.
//

import XCTest
@testable import DataStructuresAndAlgos

class BinarySearchTreeChallengesTests: XCTestCase {

    var stub: BinarySearchTreeChallenges!
    var bst: BinarySearchTree<Int>!

    override func setUp() {

        super.setUp()

        self.stub = BinarySearchTreeChallenges()
        self.bst = makeTree()
    }

    override func tearDown() {

        self.stub = nil
        self.bst = nil

        super.tearDown()
    }

    func testIsBTS() throws {

        XCTAssertTrue(self.stub.isBinarySearchTree(tree: self.bst))
    }

    func testIsEqual() throws {

        let tree = self.makeTree()
        XCTAssertTrue(self.stub.isEqual(lhs: self.bst, rhs: tree))

        var smallBst = BinarySearchTree<Int>()
        smallBst.insert(3)
        smallBst.insert(1)
        smallBst.insert(4)
        XCTAssertFalse(self.stub.isEqual(lhs: self.bst, rhs: smallBst))
    }

    func testContainsSubtree() throws {

        var subtree = BinarySearchTree<Int>()
        subtree.insert(3)
        subtree.insert(1)
        subtree.insert(4)
        XCTAssertTrue(self.stub.contains(subtree: subtree, in: self.bst))

        var otherSubtree = BinarySearchTree<Int>()
        otherSubtree.insert(6)
        otherSubtree.insert(1)
        otherSubtree.insert(7)
        XCTAssertFalse(self.stub.contains(subtree: otherSubtree, in: self.bst))
    }

    private func makeTree() -> BinarySearchTree<Int> {

        var bst = BinarySearchTree<Int>()
        bst.insert(3)
        bst.insert(1)
        bst.insert(4)
        bst.insert(0)
        bst.insert(2)
        bst.insert(5)

        return bst
    }
}
