//
//  QueueStackTests.swift
//  
//
//  Created by Diogo Araújo on 03/11/2022.
//

import XCTest
@testable import DataStructuresAndAlgos

final class QueueStackTests: XCTestCase {

    func testDefault() throws {

        var queue = QueueStack<String>()
        queue.enqueue("Ray")
        queue.enqueue("Brian")
        queue.enqueue("Eric")

        let arr = ["Ray", "Brian", "Eric"]
        XCTAssertEqual("\(queue)", String.init(describing: arr))

        let dequeued = queue.dequeue()
        let result = ["Brian", "Eric"]

        XCTAssertEqual(dequeued, "Ray")
        XCTAssertEqual("\(queue)", String.init(describing: result))

        let peek = queue.peek

        XCTAssertEqual(peek, "Brian")
    }
}
