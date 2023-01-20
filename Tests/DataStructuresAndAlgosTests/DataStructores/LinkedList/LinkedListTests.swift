//
//  LinkedListTests.swift
//  
//
//  Created by Diogo Araújo on 26/10/2022.
//

import XCTest
@testable import DataStructuresAndAlgos

final class LinkedListTests: XCTestCase {

    func testPush() throws {

        var linkedList = LinkedList<Int>()

        XCTAssertTrue(linkedList.isEmpty)

        linkedList.push(1)
        linkedList.push(2)
        linkedList.push(3)

        XCTAssertFalse(linkedList.isEmpty)

        XCTAssertEqual(linkedList.head?.value, 3)
        XCTAssertEqual(linkedList.tail?.value, 1)
        XCTAssertEqual(linkedList.head?.next?.value, 2)
        XCTAssertEqual(linkedList.head?.next?.next?.value, 1)
    }

    func testAppend() throws {

        var linkedList = LinkedList<Int>()

        XCTAssertTrue(linkedList.isEmpty)

        linkedList.append(1)
        linkedList.append(2)
        linkedList.append(3)

        XCTAssertFalse(linkedList.isEmpty)

        XCTAssertEqual(linkedList.head?.value, 1)
        XCTAssertEqual(linkedList.tail?.value, 3)

        linkedList.append(5)

        XCTAssertEqual(linkedList.head?.value, 1)
        XCTAssertEqual(linkedList.tail?.value, 5)
    }

    func testInsertAt() throws {

        var linkedList = LinkedList<Int>()

        linkedList.push(3)
        linkedList.push(2)
        linkedList.push(1)

        var middleNode = linkedList.node(at: 1)!

        XCTAssertEqual(linkedList.head?.next?.value, 2)

        middleNode = linkedList.insert(value: -1, after: middleNode)!

        XCTAssertEqual(linkedList.head?.next?.next?.value, -1)

        middleNode = linkedList.insert(value: -1, after: middleNode)!

        XCTAssertEqual(linkedList.head?.next?.next?.next?.value, -1)
    }

    func testPop() throws {

        var linkedList = LinkedList<Int>()

        linkedList.push(3)
        linkedList.push(2)
        linkedList.push(1)

        XCTAssertEqual(linkedList.head?.value, 1)

        linkedList.pop()

        XCTAssertEqual(linkedList.head?.value, 2)

        linkedList.pop()

        XCTAssertEqual(linkedList.head?.value, 3)

        linkedList.pop()

        XCTAssertTrue(linkedList.isEmpty)
        XCTAssertTrue(linkedList.tail == nil)
    }

    func testRemoveLast() throws {

        var linkedList = LinkedList<Int>()

        linkedList.push(3)
        linkedList.push(2)
        linkedList.push(1)

        XCTAssertEqual(linkedList.tail?.value, 3)

        linkedList.removeLast()

        XCTAssertEqual(linkedList.tail?.value, 2)

        linkedList.removeLast()

        XCTAssertEqual(linkedList.tail?.value, 1)

        linkedList.removeLast()

        XCTAssertTrue(linkedList.isEmpty)
        XCTAssertTrue(linkedList.tail == nil)
    }

    func testCollection() throws {

        var linkedList = LinkedList<Int>()

        for i in 0...9 {

            linkedList.append(i)
        }

        let startIndex = linkedList[linkedList.startIndex]
        let arrayFirstThree = Array(linkedList.prefix(3))
        let arrayLastThree = Array(linkedList.suffix(3))
        let sum = linkedList.reduce(0, +)

        XCTAssertEqual(startIndex, 0)
        XCTAssertEqual(arrayFirstThree, [0, 1, 2])
        XCTAssertEqual(arrayLastThree, [7, 8, 9])
        XCTAssertEqual(sum, 45)
    }
}
