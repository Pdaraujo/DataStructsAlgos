//
//  LinkedListChallengesTests.swift
//  
//
//  Created by Diogo Araújo on 28/10/2022.
//

import Foundation


import XCTest
@testable import DataStructuresAndAlgos

class LinkedListChallengesTests: XCTestCase {

    var stub: LinkedListChallenges!

    override func setUp() {

        super.setUp()

        self.stub = LinkedListChallenges()
    }

    override func tearDown() {

        self.stub = nil

        super.tearDown()
    }

    func testShowReverseValues() throws {

        var list = LinkedList<Int>()

        list.push(3)
        list.push(2)
        list.push(1)

        let order = Array([1, 2, 3].reversed())

        let result = self.stub.showReverseValues(linkedList: list)

        XCTAssertEqual(result, order)
    }

    func testFindMiddleNode() throws {

        var listOne = LinkedList<Int>()
        var listTwo = LinkedList<Int>()

        listOne.push(3)
        listOne.push(2)
        listOne.push(1)

        listTwo.push(4)
        listTwo.push(3)
        listTwo.push(2)
        listTwo.push(1)

        let middleOne = self.stub.findMiddleNode(linkedList: listOne)
        let middleTwo = self.stub.findMiddleNode(linkedList: listTwo)

        XCTAssertEqual(middleOne, 2)
        XCTAssertEqual(middleTwo, 3)
    }

    func testReverse() throws {

        var list = LinkedList<Int>()
        var reversed = LinkedList<Int>()

        reversed.push(3)
        reversed.push(2)
        reversed.push(1)

        list.push(3)
        list.push(2)
        list.push(1)

        XCTAssertEqual("\(list)", "\(reversed)")

        let result = self.stub.reverse(linkedList: list)
        reversed.reverse()

        XCTAssertEqual("\(result)", "\(reversed)")
    }

    func testMergeSorted() throws {

        var list = LinkedList<Int>()
        list.push(3)
        list.push(2)
        list.push(1)

        var anotherList = LinkedList<Int>()
        anotherList.push(-1)
        anotherList.push(-2)
        anotherList.push(-3)

        let result = self.stub.mergeSorted(list, anotherList)

        XCTAssertEqual("\(result)", "-3 -> -2 -> -1 -> 1 -> 2 -> 3     ")
    }

    func testRemoveAll() throws {

        var list = LinkedList<Int>()
        list.push(3)
        list.push(2)
        list.push(2)
        list.push(1)
        list.push(1)

        let result = self.stub.removeAll(3, in: list)

        XCTAssertEqual("\(result)", "1 -> 1 -> 2 -> 2   ")
    }
}
