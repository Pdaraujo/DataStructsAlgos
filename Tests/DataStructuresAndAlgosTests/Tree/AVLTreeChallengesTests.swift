//
//  AVLTreeChallengesTests.swift
//  
//
//  Created by Diogo Araújo on 14/12/2022.
//

import XCTest
@testable import DataStructuresAndAlgos

class AVLTreeChallengesTests: XCTestCase {

    var stub: AVLTreeChallenges!
    var avl: AVLTree<Int>!

    override func setUp() {

        super.setUp()

        self.stub = AVLTreeChallenges()
        self.avl = makeTree()
    }

    override func tearDown() {

        self.stub = nil
        self.avl = nil

        super.tearDown()
    }

    func testNumberOfLeafNodes() throws {

        let result = self.stub.numberOfLeafNodes(self.avl)

        XCTAssertEqual(result, 8)
    }

    func testNodesInTree() throws {

        let result = self.stub.nodesInTreeOf(height: 3)
        let result2 = self.stub.nodesInTreeOf(height: 4)

        XCTAssertEqual(result, 15)
        XCTAssertEqual(result2, 31)
    }

    private func makeTree() -> AVLTree<Int> {

        var avl = AVLTree<Int>()
        for i in 0..<15 {

            avl.insert(i)
        }

        return avl
    }
}
