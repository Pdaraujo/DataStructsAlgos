//
//  AVLTreeTests.swift
//  
//
//  Created by Diogo Araújo on 14/12/2022.
//

import XCTest
@testable import DataStructuresAndAlgos

final class AVLTreeTests: XCTestCase {

    func testInsert() throws {

        var avl = AVLTree<Int>()
        for i in 0..<15 {

            avl.insert(i)
        }

        XCTAssertEqual(avl.root?.value, 7)
        XCTAssertEqual(avl.root?.leftChild?.value, 3)
        XCTAssertEqual(avl.root?.rightChild?.value, 11)
    }

    func testRemove() throws {

        var tree = AVLTree<Int>()
        tree.insert(15)
        tree.insert(10)
        tree.insert(16)
        tree.insert(18)

        XCTAssertEqual(tree.root?.value, 15)
        XCTAssertEqual(tree.root?.leftChild?.value, 10)
        XCTAssertEqual(tree.root?.rightChild?.value, 16)

        tree.remove(10)

        XCTAssertEqual(tree.root?.value, 16)
        XCTAssertEqual(tree.root?.leftChild?.value, 15)
        XCTAssertEqual(tree.root?.rightChild?.value, 18)
    }
}
