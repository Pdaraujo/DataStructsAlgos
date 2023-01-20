//
//  DequeLinkedListTests.swift
//  
//
//  Created by Diogo Araújo on 04/11/2022.
//

import XCTest
@testable import DataStructuresAndAlgos

final class DequeLinkedListTests: XCTestCase {

    func testDefault() throws {

        let deque = DequeLinkedList<String>()
        deque.enqueue("Ray", to: .front)
        deque.enqueue("Brian", to: .front)
        deque.enqueue("Eric", to: .front)

        XCTAssertEqual("\(deque)", "Eric -> Brian -> Ray -> end")

        deque.enqueue("Eric", to: .back)

        XCTAssertEqual("\(deque)", "Eric -> Brian -> Ray -> Eric -> end")

        let dequeued = deque.dequeue(from: .front)

        XCTAssertEqual(dequeued, "Eric")
        XCTAssertEqual("\(deque)", "Brian -> Ray -> Eric -> end")

        let frontPeek = deque.peek(from: .front)
        let backPeek = deque.peek(from: .back)

        XCTAssertEqual(frontPeek, "Brian")
        XCTAssertEqual(backPeek, "Eric")
    }
}
