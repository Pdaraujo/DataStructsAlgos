//
//  HeapSortTests.swift
//  
//
//  Created by Diogo Araújo on 27/01/2023.
//

import XCTest
@testable import DataStructuresAndAlgos

final class HeapSortTests: XCTestCase {

    func testDefault() throws {

        let array = [9, 4, 10, 23, 3, 15, 12, 7]

        let result = Heap(elements: array, sort: >).sorted()

        let expected = [3,4,7,9,10,12,15,23]

        XCTAssert(expected == result)
    }
}
