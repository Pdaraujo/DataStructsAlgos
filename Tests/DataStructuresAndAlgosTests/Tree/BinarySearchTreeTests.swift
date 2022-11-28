//
//  BinarySearchTreeTests.swift
//  
//
//  Created by Diogo Araújo on 30/11/2022.
//

import XCTest
@testable import DataStructuresAndAlgos

final class BinarySearchTreeTests: XCTestCase {

    func testInsert() throws {

        var bst = BinarySearchTree<Int>()
        bst.insert(3)
        bst.insert(1)
        bst.insert(4)

        XCTAssertEqual(bst.root?.value, 3)
        XCTAssertEqual(bst.root?.leftChild?.value, 1)
        XCTAssertEqual(bst.root?.rightChild?.value, 4)
    }

    func testContains() throws {

        var bst = BinarySearchTree<Int>()
        bst.insert(3)
        bst.insert(1)
        bst.insert(4)

        XCTAssertTrue(bst.contains(3))
        XCTAssertFalse(bst.contains(5))
    }
}
