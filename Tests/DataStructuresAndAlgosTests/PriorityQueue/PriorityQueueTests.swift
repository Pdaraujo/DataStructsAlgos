//
//  PriorityQueueTests.swift
//  
//
//  Created by Diogo Araújo on 19/01/2023.
//

import XCTest
@testable import DataStructuresAndAlgos

final class PriorityQueueTests: XCTestCase {

    func testDeque() throws {

        var priorityQueue = PriorityQueue(elements: [1,12,3,4,1,6,8,7], sort: >)

        let expected = [12,8,7,6,4,3,1,1]
        var result = [Int]()

        while priorityQueue.isEmpty == false {

            let node = priorityQueue.dequeue()!
            result.append(node)
        }

        XCTAssert(expected == result)
    }
}

