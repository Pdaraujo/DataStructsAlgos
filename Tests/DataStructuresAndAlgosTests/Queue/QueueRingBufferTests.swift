//
//  QueueRingBufferTests.swift
//  
//
//  Created by Diogo Araújo on 03/11/2022.
//

import XCTest
@testable import DataStructuresAndAlgos

final class QueueRingBufferTests: XCTestCase {

    func testDefault() throws {

        var queue = QueueRingBuffer<String>(count: 10)
        queue.enqueue("Ray")
        queue.enqueue("Brian")
        queue.enqueue("Eric")

        XCTAssertEqual("\(queue)", "[Ray, Brian, Eric]")

        let dequeued = queue.dequeue()

        XCTAssertEqual(dequeued, "Ray")
        XCTAssertEqual("\(queue)", "[Brian, Eric]")

        let peek = queue.peek

        XCTAssertEqual(peek, "Brian")
    }
}

