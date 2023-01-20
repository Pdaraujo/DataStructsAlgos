//
//  HeapTests.swift
//  
//
//  Created by Diogo Araújo on 19/01/2023.
//

import XCTest
@testable import DataStructuresAndAlgos

final class HeapTests: XCTestCase {

    func testRemove() throws {

        var heap = Heap(elements: [1,12,3,4,1,6,8,7], sort: >)

        let expected = [12,8,7,6,4,3,1,1]
        var result = [Int]()

        while heap.isEmpty == false {

            let node = heap.remove()!
            result.append(node)
        }

        XCTAssert(expected == result)
    }
}
