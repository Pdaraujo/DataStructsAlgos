//
//  StackTests.swift
//  
//
//  Created by Diogo Araújo on 26/10/2022.
//

import XCTest
@testable import DataStructuresAndAlgos

final class StackTests: XCTestCase {

    func testStack() throws {

        var stack = Stack<Int>()

        XCTAssertTrue(stack.isEmpty)

        stack.push(1)
        stack.push(2)

        XCTAssertFalse(stack.isEmpty)

        let element = stack.pop()

        XCTAssertEqual(element, 2)

        let peek = stack.peek()

        XCTAssertEqual(peek, 1)
        XCTAssertFalse(stack.isEmpty)
    }

    func testStackInit() throws {

        var stack = Stack([1, 2, 3])
        var newStack: Stack = [1, 2, 3]

        XCTAssertFalse(stack.isEmpty)
        XCTAssertFalse(newStack.isEmpty)

        let element = stack.pop()
        let newElement = newStack.pop()

        XCTAssertEqual(element, 3)
        XCTAssertEqual(newElement, 3)

        let peek = stack.peek()
        let newPeek = newStack.peek()

        XCTAssertEqual(peek, 2)
        XCTAssertEqual(newPeek, 2)
    }
}
