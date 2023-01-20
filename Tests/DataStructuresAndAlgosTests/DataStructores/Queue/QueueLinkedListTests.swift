//
//  QueueLinkedListTests.swift
//  
//
//  Created by Diogo Araújo on 03/11/2022.
//

import XCTest
@testable import DataStructuresAndAlgos

final class QueueLinkedListTests: XCTestCase {

    func testDefault() throws {

        let queue = QueueLinkedList<String>()
        queue.enqueue("Ray")
        queue.enqueue("Brian")
        queue.enqueue("Eric")

        XCTAssertEqual("\(queue)", "Ray -> Brian -> Eric -> end")

        let dequeued = queue.dequeue()

        XCTAssertEqual(dequeued, "Ray")
        XCTAssertEqual("\(queue)", "Brian -> Eric -> end")

        let peek = queue.peek

        XCTAssertEqual(peek, "Brian")
    }
}
